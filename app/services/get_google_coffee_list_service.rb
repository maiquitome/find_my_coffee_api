require 'rest-client'
require 'json'

class GetGoogleCoffeeListService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end
  
  def call
    begin
      initial_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffee+shops"
      
      location = "location=#{@latitude},#{@longitude}"
      
      radius = "radius=5000"
      
      key = "key=#{Rails.application.credentials.google_secret_key}"
      
      url = "#{initial_url}&#{location}&#{radius}&#{key}"
      
      # response = RestClient.get base_url
      
      headers = {
        :content_type => 'application/json', 
        :accept => 'application/json'
      }
      
      response = RestClient::Request.execute(
        method: :get, 
        url: url, 
        headers: headers, 
        verify_ssl: false
      )
      
      JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end