module Pexels

  class Photo
    attr_reader :id, :url, :photographer, :photographer_url, :width, :height

    def initialize(attributes)
      @id = attributes["id"]
      @url = attributes["url"]
      @photographer = attributes["photographer"]
      @photographer_url = attributes["photographer_url"]
      @width = attributes["width"]
      @height = attributes["height"]
    end

    def self.get(id)
      connection = Pexels::Client.new.connect
      response = connection.get "photos/#{id}"
      photo = Pexels::Photo.new JSON.parse(response.body)
    end

    def self.search(query, per_page=15, page=1)
      connection = Pexels::Client.new.connect
      response = connection.get "search?query=#{query}&per_page=#{per_page}&page=#{page}"
      result = JSON.parse(response.body)
      result['photos'].map { |photo| new(photo) }
    end
  end

end
