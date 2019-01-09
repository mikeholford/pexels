module Pexels

  class Client

    def connect
      api_endpoint = 'https://api.pexels.com/v1'
      # access_token = options.delete(:access_token) || raise('No Access Token given to Pexels Client')
      Faraday.new(:url => api_endpoint, :headers => {'Authorization' => "#{Pexels.configuration.access_token}"})
    end

    # 563492ad6f91700001000001a9099b0e2801496db40fb7cfd0801845
    # Pexels.configuration.access_token
  end

end
