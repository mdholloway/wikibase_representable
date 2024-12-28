# frozen_string_literal: true

require 'wikibase/model/term/term'
require 'wikibase/representers/term/term_representer'

module Wikibase
  module Representers
    module Term
      include Wikibase::DataModel::Term

      describe TermRepresenter do
        let(:term) { Term::Term.new(language_code: 'en', value: 'Douglas Adams') }
        let(:representer) { described_class.new(term) }
        let(:json) { '{"language":"en","value":"Douglas Adams"}' }

        it 'serializes a term object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes a term object' do
          expect(described_class.new(Term::Term.new).from_json(json)).to eq(term)
        end
      end
    end
  end
end
