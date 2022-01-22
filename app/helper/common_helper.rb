module CommonHelper
  def convert_to_array_remove_first
    people_array = given_format.split(/\n/)
    people_array.drop(1)
  end

  def remove_leading_zeroes(date_attribute)
    date_attribute.sub!(/^0*/, '')
  end
end

