class Store
  attr_reader :name, :city, :distance, :phone, :type

  def initialize( name, city, distance, phone, type )
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
      require "pry"; binding.pry
      Store.new(
        name: store.name,
        city: store.city,
        distance: store.distance,
        phone: store.phone,
        type: store.type
      )
    end
  end

end
