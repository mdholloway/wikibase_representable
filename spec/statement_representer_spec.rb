# frozen_string_literal: true

require 'wikibase_representable/model'
require 'wikibase_representable/representers/statement_representer'

module WikibaseRepresentable
  module Representers
    include WikibaseRepresentable::Model

    describe StatementRepresenter do
      let(:data_value) { DataValue.new(type: 'string', value: 'foo') }
      let(:main_snak) do
        PropertyValueSnak.new(property_id: 'P1', hash: 'abcdef', data_value: data_value)
      end
      let(:statement) do
        Statement.new(main_snak: main_snak,
                      guid: 'Q1$d82dd1f5-f0ca-44e9-9064-ef0f9cbc719c')
      end
      let(:representer) { described_class.new(statement) }
      let(:json) do
        '{"mainsnak":{"snaktype":"value","property":"P1","hash":"abcdef","datavalue":' \
          '{"value":"foo","type":"string"}},"qualifiers":{},"type":"statement","id":' \
          '"Q1$d82dd1f5-f0ca-44e9-9064-ef0f9cbc719c","rank":"normal"}'
      end

      it 'serializes a statement object' do
        expect(representer.to_json).to eq(json)
      end

      it 'deserializes a statement object' do
        expect(described_class.new(Statement.new).from_json(json)).to eq(statement)
      end
    end
  end
end
