class PriceLogic1
  include HTTParty

  def call
    response = self.class.get('http://time.com/')

    return unless response.success?

    content = ActionView::Base.full_sanitizer.sanitize(response.body)
    content.count('a') / 100.0
  end
end
