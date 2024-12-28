# frozen_string_literal: true

require 'wikibase/model/data_value/time'
require 'wikibase/representers/data_value/time_representer'

module Wikibase
  module Representers
    module DataValue
      include Wikibase::DataModel::DataValue

      describe TimeRepresenter do
        let(:time) do
          Time.new(time: '+2023-02-03T00:00:00Z', time_zone: 0, before: 0, after: 0, precision: 11,
                   calendar_model: 'http://www.wikidata.org/entity/Q1985727')
        end
        let(:representer) { described_class.new(time) }
        let(:json) do
          '{"time":"+2023-02-03T00:00:00Z","timezone":0,"before":0,"after":0,"precision":11,"calendarmodel":"http://www.wikidata.org/entity/Q1985727"}'
        end

        it 'serializes a time data value object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes a time data value object' do
          expect(described_class.new(Time.new).from_json(json)).to eq(time)
        end
      end
    end
  end
end
