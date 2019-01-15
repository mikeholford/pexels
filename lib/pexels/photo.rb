module Pexels

  class Photo
    attr_reader :id, :width, :height, :url, :source, :photographer, :photographer_url

    def initialize(attributes)
      @id = attributes["id"]
      @width = attributes["width"]
      @height = attributes["height"]
      @url = attributes["url"]
      @source = attributes["src"]["original"]
      @photographer = attributes["photographer"]
      @photographer_url = attributes["photographer_url"]
    end

    def self.connection
      url = "https://api.pexels.com/v1"
      Pexels::Client.new.connect(url)
    end

    def self.get(id)
      response = Photo.connection.get "photos/#{id}"
      photo = JSON.parse(response.body)
      new(photo)
    end

    def self.search(query, per_page=15, page=1)
      response = Photo.connection.get "search?query=#{query}&per_page=#{per_page}&page=#{page}"
      result = JSON.parse(response.body)
      result['photos'].map { |photo| new(photo) }
    end

    def self.curated(per_page=15, page=1)
      response = Photo.connection.get "curated?&per_page=#{per_page}&page=#{page}"
      result = JSON.parse(response.body)
      result['photos'].map { |photo| new(photo) }
    end

    def self.random
      response = Photo.connection.get "curated?&per_page=1&page=#{rand(1000)}"
      result = JSON.parse(response.body)
      new(result['photos'].first)
    end

  end

end
