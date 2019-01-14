module Pexels

  class Client
    def connect(url)
      Faraday.new(:url => url, :headers => {'Authorization' => "#{Pexels.configuration.access_token}"})
    end
  end

end
