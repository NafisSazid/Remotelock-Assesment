require './app/helper/common_helper.rb'

class ParsePeopleByDollar < ParsePeople
  include CommonHelper

  STATE_HASH = {
      'LA' => 'Los Angeles',
      'NYC' => 'New York City'
  }.freeze

  def format_by_first_name_city_birth_date
    people_array = convert_to_array_remove_first
    people_array.map do |people|
      people_attributes = people.split('$')
      date =  people_attributes[1].strip.split('-')
      preferred_date_format = remove_leading_zeroes(date[1]) + '/' +
          remove_leading_zeroes(date[0]) + '/' +
          remove_leading_zeroes(date[2])
      people_attributes[3].strip + ', ' +
          STATE_HASH[people_attributes[0].strip] + ', ' +
          preferred_date_format
    end
  end
end
