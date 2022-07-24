require 'spec_helper'

RSpec.describe ParsePeopleByDollar do
  let(:params) { File.read('spec/fixtures/people_by_dollar.txt') }
  let(:parse_people) { described_class.new(params) }

  describe 'convert the input string to array' do
    it 'parses dollar input file and outputs array of each people' do
      
      people_array = parse_people.convert_to_array
      expect(people_array).to eq [
                                     'city $ birthdate $ last_name $ first_name',
                                     'LA $ 30-4-1974 $ Nolan $ Rhiannon',
                                     'NYC $ 5-1-1962 $ Bruen $ Rigoberto',
                                 ]
    end
  end

  describe 'dollar formats converted to specified format with comma' do
    it 'parses dollar input file and outputs normalized data' do
      normalized_people = parse_people.format_by_first_name_city_birth_date

      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      expect(normalized_people).to eq [
                                          'Rhiannon, Los Angeles, 4/30/1974',
                                          'Rigoberto, New York City, 1/5/1962',
                                      ]
    end
  end
end
