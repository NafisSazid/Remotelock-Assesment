require './app/helper/common_helper.rb'

class ParsePeopleByPercent < ParsePeople
  include CommonHelper

  def format_by_first_name_city_birth_date
    people_array = convert_to_array_remove_first
    people_array.map do |people|
      people_attributes = people.split('%')
      date =  people_attributes[2].strip.split('-')
      preferred_date_format = remove_leading_zeroes(date[1]) + '/' +
          remove_leading_zeroes(date[2]) + '/' +
          remove_leading_zeroes(date[0])
      people_attributes[0].strip + ', ' + people_attributes[1].strip + ', ' + preferred_date_format
    end
  end
end
