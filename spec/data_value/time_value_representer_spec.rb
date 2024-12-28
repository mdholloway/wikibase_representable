# frozen_string_literal: true

require 'wikibase/model/data_value/time'
require 'wikibase/model/data_value/time_value'
require 'wikibase/representers/data_value/time_value_representer'

module Wikibase
  module Representers
    module DataValue
      describe TimeValueRepresenter do
        let(:time) do
          Wikibase::Model::DataValue::Time.new(time: '+2023-02-03T00:00:00Z',
                                               time_zone: 0,
                                               before: 0,
                                               after: 0,
                                               precision: 11,
                                               calendar_model: 'http://www.wikidata.org/entity/Q1985727')
        end
        let(:time_value) { Wikibase::Model::DataValue::TimeValue.new(value: time) }
        let(:representer) { described_class.new(time_value) }
        let(:json) do
          '{"value":{"time":"+2023-02-03T00:00:00Z","timezone":0,"before":0,"after":0,"precision":11,"calendarmodel":"http://www.wikidata.org/entity/Q1985727"},"type":"time"}'
        end

        it 'serializes an entity ID value object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes an entity ID value object' do
          expect(described_class.new(Wikibase::Model::DataValue::TimeValue.new).from_json(json)).to eq(time_value)
        end
      end
    end
  end
end
