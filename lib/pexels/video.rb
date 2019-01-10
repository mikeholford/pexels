module Pexels

  class Video
    attr_reader :id, :width, :height, :url, :image, :duration, :files, :pictures

    def initialize(attributes)
      @id = attributes["id"]
      @width = attributes["width"]
      @height = attributes["height"]
      @url = attributes["url"]
      @image = attributes["image"]
      @duration = attributes["duration"]
      @files = attributes["video_files"]
      @pictures = attributes["video_pictures"]
    end

    def self.search(query, per_page=15, page=1)
      connection = Pexels::Client.new.connect('video')
      response = connection.get "videos/search?query=#{query}&per_page=#{per_page}&page=#{page}"
      result = JSON.parse(response.body)
      result['videos'].map { |video| new(video) }
    end

    def self.popular(per_page=15, page=1)
      connection = Pexels::Client.new.connect('video')
      response = connection.get "videos/popular?per_page=#{per_page}&page=#{page}"
      result = JSON.parse(response.body)
      result['videos'].map { |video| new(video) }
    end

  end

end
