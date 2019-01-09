module Pexels

  class Client
    def connect
      api_endpoint = 'https://api.pexels.com/v1'
      Faraday.new(:url => api_endpoint, :headers => {'Authorization' => "#{Pexels.configuration.access_token}"})
    end
  end

end
