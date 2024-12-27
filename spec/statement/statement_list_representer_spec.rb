# frozen_string_literal: true

require 'model/data_value/data_value'
require 'model/snak/property_value_snak'
require 'model/statement/statement'
require 'model/statement/statement_list'
require 'representers/statement/statement_list_representer'

module Wikibase
  module Representers
    module Statement
      include Wikibase::DataModel::DataValue
      include Wikibase::DataModel::Snak
      include Wikibase::DataModel::Statement

      describe StatementListRepresenter do
        let(:data_value) { Wikibase::DataModel::DataValue::DataValue.new(type: 'string', value: 'foo') }
        let(:main_snak) { PropertyValueSnak.new(property_id: 'P1', hash: 'abcdef', data_value: data_value) }
        let(:statement) do
          Wikibase::DataModel::Statement::Statement.new(main_snak: main_snak,
                                                        guid: 'Q1$d82dd1f5-f0ca-44e9-9064-ef0f9cbc719c')
        end
        let(:statement_list) do
          Wikibase::DataModel::Statement::StatementList.new(statements: { 'P1' => [statement] })
        end
        let(:representer) { described_class.new(statement_list) }
        let(:json) do
          '{"P1":[{"mainsnak":{"snaktype":"value","property":"P1","hash":"abcdef",' \
            '"datavalue":{"value":"foo","type":"string"}},"qualifiers":{},"type":"statement",' \
            '"id":"Q1$d82dd1f5-f0ca-44e9-9064-ef0f9cbc719c","rank":"normal"}]}'
        end

        it 'serializes a statement list object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes a statement list object' do
          expect(described_class.new(Wikibase::DataModel::Statement::StatementList.new)
            .from_json(json))
            .to eq(statement_list)
        end
      end
    end
  end
end