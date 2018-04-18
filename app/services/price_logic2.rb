class PriceLogic2
  include HTTParty
  base_uri 'http://openlibrary.org/'

  def call
    response = self.class.get('/search.json?q=the+lord+of+the+rings/')

    return unless response.success?

    content = JSON.parse(response.body)
    count_large_arrays(content)
  end

  private

  def count_large_arrays(json, min_size = 10)
    num_of_large_arrays = 0

    json['docs'].try(:each) do |element|
      element.try(:each_value) do |value|
        num_of_large_arrays += 1 if large_array?(value, min_size)
      end
    end
    num_of_large_arrays
  end

  def large_array?(array, min_size)
    return unless array.is_a? Array

    array.count > min_size
  end
end
