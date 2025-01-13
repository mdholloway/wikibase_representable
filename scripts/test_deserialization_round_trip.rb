# frozen_string_literal: true

# Tests round-trip deserialization and serialization of Wikibase entities.
# Attempts to correct for quirks in the Wikibase output format such as optional escape characters
# used by PHP and not Ruby (though this can lead to false-positive diffs where the data contains a
# backslash that looks like an escape character but isn't.).

require 'diffy'
require 'json'
require 'optparse'
require 'wikibase_representable'
require 'zlib'

dir = File.dirname __FILE__

export_file = File.expand_path '../../../DigitalScriptorium/ds-exports/json/ds-latest.json.gz', dir

OptionParser.new { |opts|
  opts.banner = 'Usage: test_wikibase_representable_ds_serialization.rb [options]'

  opts.on('-f', '--file=FILE', 'The file path to the Wikibase JSON export file.') do |f|
    export_file = File.expand_path f, dir
  end
}.parse!

lines_examined = 0
parse_errors = 0
diff_count = 0

def decorator(type)
  if type == WikibaseRepresentable::Model::Item::ENTITY_TYPE
    WikibaseRepresentable::Representers::ItemRepresenter
  else
    WikibaseRepresentable::Representers::PropertyRepresenter
  end
end

def clazz(type)
  if type == WikibaseRepresentable::Model::Item::ENTITY_TYPE
    WikibaseRepresentable::Model::Item
  else
    WikibaseRepresentable::Model::Property
  end
end

# File.readlines('../../hxsllc/hxs-blacklight/lib/export-prod-0328.json').each do |line|
Zlib::GzipReader.open(export_file).each_line do |line|
  next if ["[\n", "]\n"].include?(line)

  lines_examined += 1

  line = line
         .gsub(/(^\[|\]$|,\n$)/, '')
         # Strip PHP-specific escape characters for diffing
         # See https://stackoverflow.com/a/56834902 for discussion
         .gsub(%r{\\(/|[A-Za-z0-9])}, '\1')

  begin
    hash = JSON.parse(line)
  rescue StandardError
    puts "***PARSE ERROR***\n#{line}\n\n"
    parse_errors += 1
    next
  end

  decorator = decorator(hash['type'])
  clazz = clazz(hash['type'])
  obj = decorator.new(clazz.new).from_json(line)
  diff = Diffy::Diff.new("#{line}\n", "#{decorator.new(obj)
    .to_json
    # Adjust empty associative arrays to match PHP serialization
    .gsub(/\{\}/, '[]')}\n")

  unless diff.to_s.empty?
    puts("***DIFF***\n#{diff}\n\n")
    diff_count += 1
  end
end

# 3 items with known diffs: Q37381, Q43197 (both due to improperly regex-stripped backslash), Q66686 (TBD)
puts "Lines examined: #{lines_examined}"
puts "Parse errors: #{parse_errors}"
puts "Diff count: #{diff_count}"

exit [diff_count + parse_errors, 1].min
