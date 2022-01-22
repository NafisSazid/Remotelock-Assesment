require './app/services/parse_people.rb'
require './app/services/parse_people_by_dollar.rb'
require './app/services/parse_people_by_percent.rb'

class PeopleController
  ORDERS = %i(first_name city birth_date).freeze

  def initialize(params)
    @params = params
  end

  def normalize
    dollar_format = params[:dollar_format]
    percent_format = params[:percent_format]
    info_from_dollar_format = ::ParsePeopleByDollar.new(dollar_format).
        format_by_first_name_city_birth_date
    info_from_percent_format = ::ParsePeopleByPercent.new(percent_format).
        format_by_first_name_city_birth_date
    normalized_info = info_from_dollar_format + info_from_percent_format
    sort_by_first_name(normalized_info, params[:order])
  end

  private

  def sort_by_first_name(normalized_people, order)
    normalized_people.sort_by do |people|
      people_attributes = people.split(',')
      index = ORDERS.find_index(order)
      people_attributes[index]
    end
  end

  attr_reader :params
end
