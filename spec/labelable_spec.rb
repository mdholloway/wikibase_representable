# frozen_string_literal: true

require 'wikibase_representable/model/term'
require 'wikibase_representable/model/labelable'

class DummyClass
  include WikibaseRepresentable::Model::Labelable

  def initialize labels
    @labels = labels
  end
end

RSpec.describe 'WikibaseRepresentable::Model::Labelable' do

  subject(:dummy) { DummyClass.new(labels) }

  let(:labels) { { 'en' => [term] } }

  let(:term) do
    WikibaseRepresentable::Model::Term.new(language_code: 'en', value: 'Douglas Adams')
  end

  describe '#each_label' do
    it 'enumerates labels' do
      expect { |b| subject.each_label(&b) }.to yield_control
    end

    it 'yields the expected values' do
      expect { |b| subject.each_label(&b) }.to yield_with_args('en', [term])
    end
  end
end
