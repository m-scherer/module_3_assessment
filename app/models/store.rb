class Store
  attr_reader :name, :city, :distance, :phone, :type
  attr_accessor :id

  def initialize( id, name, city, distance, phone, type )
    @id = id
    @name = name
    @city = city
    @distance = distance
    @phone = phone
    @type = type
  end

  def self.create_stores(zip, area)
    response = BestBuyService.new.find_stores_by_zip_area(zip, area)
    stores = JSON.parse(response.body, symbolize_names: true)[:stores]
    stores.map do |store|
      Store.new(
        store[:storeId],
        store[:longName],
        store[:city],
        store[:distance],
        store[:phone],
        store[:storeType]
      )
    end
  end

end
