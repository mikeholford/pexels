# Ruby bindings
require "faraday"
require "json"

# Version
require "pexels/version"

# Config
require "pexels/configuration"

# API Operations
require "pexels/client"
require "pexels/photo"

module Pexels
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
