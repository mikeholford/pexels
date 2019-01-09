module Pexels

  class Client
    def connect
      api_endpoint = 'https://api.pexels.com/v1'
      # access_token = options.delete(:access_token) || raise('No Access Token given to Pexels Client')
      Faraday.new(:url => api_endpoint, :headers => {'Authorization' => "#{Pexels.configuration.access_token}"})
    end
  end

end
