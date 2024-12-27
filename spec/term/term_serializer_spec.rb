# frozen_string_literal: true

require 'model/term/term'
require 'serializers/term/term_serializer'

module Wikibase
  module Serializers
    module Term
      include Wikibase::DataModel::Term

      describe TermSerializer do
        let(:term) { Term::Term.new(language_code: 'en', value: 'Douglas Adams') }
        let(:serializer) { described_class.new(term) }
        let(:json) { '{"language":"en","value":"Douglas Adams"}' }

        it 'serializes a term object' do
          expect(serializer.to_json).to eq(json)
        end

        it 'deserializes a term object' do
          expect(described_class.new(Term::Term.new).from_json(json)).to eq(term)
        end
      end
    end
  end
end
