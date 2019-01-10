module Pexels

  class Client
    def connect(type)
      Faraday.new(:url => api_endpoint(type), :headers => {'Authorization' => "563492ad6f91700001000001a9099b0e2801496db40fb7cfd0801845"})
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
