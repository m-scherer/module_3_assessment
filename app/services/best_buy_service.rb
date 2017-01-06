class BestBuyService

  def find_stores_by_zip_area(zip, area)
    conn.get "/v1/stores(area(#{zip},#{area}))", {
                format: 'json',
                show: 'storeId,longName,city,distance,phone,storeType',
                apiKey: ENV['BEST_BUY_KEY']
              }
  end

  def conn
    Faraday.new(:url => 'https://api.bestbuy.com') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

end
