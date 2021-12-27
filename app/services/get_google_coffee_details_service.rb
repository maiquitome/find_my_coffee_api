require 'rest-client'
require 'json'

class GetGoogleCoffeeDetailsService
  def initialize(google_place_id)
    @google_place_id = google_place_id
  end
  
  def call
    begin
      initial_url = "https://maps.googleapis.com/maps/api/place/details/json"
      
      key = "key=#{Rails.application.credentials.google_secret_key}"
      
      place_id = "place_id=#{@google_place_id}"
      
      url = "#{initial_url}?#{place_id}&#{key}"
      
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
      
      value = JSON.parse(response.body) # retorna a última coisa a ser executada
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end