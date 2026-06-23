# frozen_string_literal: true

require 'spec_helper'

module WikibaseRepresentable
  module Representers
    describe StatementHashRepresenter do
      let(:data_value) { Model::DataValue.new(type: 'string', value: 'foo') }
      let(:main_snak) do
        Model::PropertyValueSnak.new(property_id: 'P1', hash: 'abcdef', data_value: data_value)
      end
      let(:statement_hash) do
        { 'P1' => [Model::Statement.new(main_snak: main_snak, guid: 'Q1$d82dd1f5-f0ca-44e9-9064-ef0f9cbc719c')] }
      end
      let(:representer) { described_class.new(statement_hash) }
      let(:json) do
        <<~JSON
          {
            "P1": [
              {
                "mainsnak": {
                  "snaktype": "value",
                  "property": "P1",
                  "hash": "abcdef",
                  "datavalue": {
                    "value": "foo",
                    "type": "string"
                  }
                },
                "type": "statement",
                "id": "Q1$d82dd1f5-f0ca-44e9-9064-ef0f9cbc719c",
                "rank": "normal"
              }
            ]
          }
        JSON
      end

      it 'serializes a statement list object' do
        expect(representer.to_json).to eq(JSON.parse(json).to_json)
      end

      it 'deserializes a statement list object' do
        expect(described_class.new(Model::StatementHash.new)
          .from_json(json))
          .to eq(statement_hash)
      end
    end
  end
end
