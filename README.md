# wikibase_representable

Provides Wikibase data model classes and support (by way of [representable](https://rubygems.org/gems/representable)) for serializing and deserializing Wikibase data objects to and from JSON and fluently accessing their properties.

## Installation
Install the gem and add to the application's Gemfile by executing:

```bash
bundle add wikibase_representable
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install wikibase_representable
```

## Usage
```ruby
include WikibaseRepresentable::Model
include WikibaseRepresentable::Representers

# Deserialize an entity from JSON
json = '{"type":"item","id":"Q42","labels":{"en":{"language":"en","value":"Douglas Adams"}}}'
item = ItemRepresenter.new(Item.new).from_json(json)
# => #<WikibaseRepresentable::Model::Item:0x0000000...

# Retrieve entity data 
item.labels('en')
# => "Douglas Adams"

# Serialize an entity to JSON
json = ItemRepresenter.new(item).to_json
# => "{\"type\":\"item\",\"id\":\"Q42\"...
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mdholloway/wikibase_representable.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
