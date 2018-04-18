class PriceLogic3
  include HTTParty

  def call
    response = self.class.get('http://time.com/')

    return unless response.success?

    content = Nokogiri::HTML(response.body).search('*')
    content.count / 100.0
  end
end
