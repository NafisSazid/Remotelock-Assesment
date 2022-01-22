require 'spec_helper'

RSpec.describe ParsePeopleByPercent do
  let(:params) { File.read('spec/fixtures/people_by_percent.txt') }
  let(:parse_people) { described_class.new(params) }

  describe 'convert the input string to array' do
    it 'parses dollar input file and outputs array of each people' do
      people_array = parse_people.convert_to_array
      expect(people_array).to eq [
                                     'first_name % city % birthdate',
                                     'Mckayla % Atlanta % 1986-05-29',
                                     'Elliot % New York City % 1947-05-04'
                                 ]
    end
  end

  describe 'percent formats converted to specified format with comma' do
    it 'parses percent input file and outputs normalized data' do
      normalized_people = parse_people.format_by_first_name_city_birth_date

      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      expect(normalized_people).to eq [
                                          'Mckayla, Atlanta, 5/29/1986',
                                          'Elliot, New York City, 5/4/1947',
                                      ]
    end
  end
end
