module Pexels

  class Client
    def connect(type)
      Faraday.new(:url => api_endpoint(type), :headers => {'Authorization' => "#{Pexels.configuration.access_token}"})
    end

    def api_endpoint(type)
      if type == 'photo'
        api_endpoint = 'https://api.pexels.com/v1'
      elsif type == 'video'
        api_endpoint = 'https://api.pexels.com'
      end
    end

  end

end
