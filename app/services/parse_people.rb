class ParsePeople
  attr_reader :given_format

  def initialize(given_format)
    @given_format = given_format
  end

  def format_by_first_name_city_birth_date
    fail 'Must be Implemented'
  end
end
