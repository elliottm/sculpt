class Order

  include DataMapper::Resource

  property :id, Serial # Serial means that it will be auto-incremented for every record
  property :email, String
  property :name, String
  property :created_at, String
  property :address_1, String
  property :address_2, String
  property :postcode, String  
  property :product, String
  
end