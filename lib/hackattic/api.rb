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
      JSON.parse Net::HTTP.get_response(uri(path)).body
    end

    def post(path, data)
      uri = uri(path)
      request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      request.body = data.to_json
      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request request
      end
      JSON.parse response.body
    end

    private

    def uri(path)
      URI.parse("#{BASE}/#{path}?access_token=#{@access_token}")
    end
  end
end
