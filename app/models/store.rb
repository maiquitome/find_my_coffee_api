class Store < ApplicationRecord
  has_many :ratings # Store.last.ratings
  validates_presence_of :lonlat, :name, :google_place_id
  validates :google_place_id, uniqueness: true
  
  # cafés amados mais próximos (5km de raio por padrão)
  # utilizando o postgis
  
  ### cadastrando: ###
  
    # DISTANCIA MAIS PERTO
    # irb(main):003:0> Store.create(name: "Coffee 1", lonlat: "POINT(#{-49.269827} #{-25.447306})", address: "endereço 1", google_place_id: "xyz1")
    
    # DISTANCIA MAIS LONGE
    # irb> Store.create(name: "Coffee 2", lonlat: "POINT(#{-49.451053} #{-25.439806})", address: "endereço 2", google_place_id: "xyz2")
  
  #### buscando o local mais próximo: ###
  
    # irb> Store.within(-49.267421, -25.437904)
    
    # irb> Store.within(-49.267421, -25.437904).count
    # => 1
    
  #### buscando os dois locais: ###
  
    # irb> Store.within(-49.267421, -25.437904, 100).count
    # => 2
  
  scope :within, -> (longitude, latitude, distance_in_km = 5) {
    # método para encontrar coisas nesse raio de 5km
    
    # SELECT "stores".* FROM "stores" WHERE (
    #   ST_Distance(lonlat, 'POINT(-49.267421 -25.437904)') < 5000
    # )
    where(%{
      ST_Distance(lonlat, 'POINT(%f %f)') < %d
    } % [longitude, latitude, distance_in_km * 1000])
  }
end
