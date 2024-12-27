# frozen_string_literal: true

require 'model/data_value/time'
require 'model/data_value/time_value'
require 'representers/data_value/time_value_representer'

module Wikibase
  module Representers
    module DataValue
      include Wikibase::DataModel::DataValue

      describe TimeValueRepresenter do
        let(:time) do
          Time.new(time: '+2023-02-03T00:00:00Z', time_zone: 0, before: 0, after: 0, precision: 11,
                   calendar_model: 'http://www.wikidata.org/entity/Q1985727')
        end
        let(:time_value) { TimeValue.new(value: time) }
        let(:representer) { described_class.new(time_value) }
        let(:json) do
          '{"value":{"time":"+2023-02-03T00:00:00Z","timezone":0,"before":0,"after":0,"precision":11,"calendarmodel":"http://www.wikidata.org/entity/Q1985727"},"type":"time"}'
        end

        it 'serializes an entity ID value object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes an entity ID value object' do
          expect(described_class.new(TimeValue.new).from_json(json)).to eq(time_value)
        end
      end
    end
  end
end
