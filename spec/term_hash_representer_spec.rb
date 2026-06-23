# frozen_string_literal: true

require 'spec_helper'

module WikibaseRepresentable
  module Representers
    describe TermHashRepresenter do
      let(:term_hash) do
        { 'en' => Model::Term.new(language_code: 'en', value: 'Douglas Adams') }
      end
      let(:representer) { described_class.new(term_hash) }
      let(:json) { '{"en":{"language":"en","value":"Douglas Adams"}}' }

      it 'serializes a term list object' do
        expect(representer.to_json).to eq(json)
      end

      it 'deserializes a term list object' do
        expect(described_class.new(Model::TermHash.new).from_json(json)).to eq(term_hash)
      end
    end
  end
end
