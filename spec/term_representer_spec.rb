# frozen_string_literal: true

require 'spec_helper'

module WikibaseRepresentable
  module Representers
    describe TermRepresenter do
      let(:term) { Model::Term.new(language_code: 'en', value: 'Douglas Adams') }
      let(:representer) { described_class.new(term) }
      let(:json) { '{"language":"en","value":"Douglas Adams"}' }

      it 'serializes a term object' do
        expect(representer.to_json).to eq(json)
      end

      it 'deserializes a term object' do
        expect(described_class.new(Model::Term.new).from_json(json)).to eq(term)
      end
    end
  end
end
