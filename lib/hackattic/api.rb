require 'net/http'
require 'uri'
require 'json'

module Hackattic
  class API
    BASE = 'https://hackattic.com'.freeze

    def initialize(access_token)
      @access_token = access_token
    end

    def get(path)
      uri = URI.parse("#{BASE}/#{path}?access_token=#{@access_token}")
      JSON.parse Net::HTTP.get_response(uri).body
    end
  end
end
