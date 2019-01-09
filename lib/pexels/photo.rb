module Pexels

  class Photo
    attr_reader :id, :width, :height, :url, :photographer, :photographer_url

    def initialize(attributes)
      @id = attributes["id"]
      @width = attributes["width"]
      @height = attributes["height"]
      @url = attributes["url"]
      @photographer = attributes["photographer"]
      @photographer_url = attributes["photographer_url"]
    end

    def self.get(id)
      connection = Pexels::Client.new.connect
      response = connection.get "photos/#{id}"
      photo = JSON.parse(response.body)
      new(photo)
    end

    def self.search(query, per_page=15, page=1)
      connection = Pexels::Client.new.connect
      response = connection.get "search?query=#{query}&per_page=#{per_page}&page=#{page}"
      result = JSON.parse(response.body)
      result['photos'].map { |photo| new(photo) }
    end

    def self.curated(per_page=15, page=1)
      connection = Pexels::Client.new.connect
      response = connection.get "curated?&per_page=#{per_page}&page=#{page}"
      result = JSON.parse(response.body)
      result['photos'].map { |photo| new(photo) }
    end

    def self.random
      connection = Pexels::Client.new.connect
      response = connection.get "curated?&per_page=1&page=#{rand(1000)}"
      result = JSON.parse(response.body)
      new(result['photos'].last)
    end

  end

end
