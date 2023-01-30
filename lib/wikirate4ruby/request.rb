require 'faraday'
require 'logger'
require_relative './request_utils'

module Wikirate4ruby
  module REST
    class Request
      include Wikirate4ruby::RequestUtils

      attr :wikirate_api_url, :api_key, :auth, :logger

      def initialize(api_key, wikirate_api_url, auth = {})
        @wikirate_api_url = wikirate_api_url
        @api_key = api_key
        @auth = auth
        @logger = Logger.new(STDOUT)
      end

      # @param [String] endpoint
      # @param [Array] endpoint_params
      # @param [Array] filters
      # @param [Hash] params
      def get(endpoint, endpoint_params = [], filters = [], params = {})
        data = {}
        params.each do |key, value|
          next if value.nil?

          if endpoint_params.include? key
            data[key] = value.to_s
          elsif filters.include? key
            if %w[value_from value_to].include?(key)
              data["filter[value][#{key.gsub(/.*_/, '')}]"] = value.to_s
            else
              data["filter[#{key}]"] = value.to_s
            end
          else
            @logger.warn("Unexpected parameter #{key}")
          end
        end
        request(:get, endpoint, data)
      end

      def post(endpoint, data = {})
        request(:post, endpoint, data)
      end

      private

      # @param [String] method
      # @param [String] endpoint
      # @param [Array] data
      # @param [Hash] _options
      # @return [Hash]
      def request(method, endpoint, data = {}, **_options)
        url = URI.parse("#{@wikirate_api_url}#{endpoint}")

        connection = Faraday.new do |conn|
          conn.request :authorization, :basic, @auth[:username], @auth[:password] unless auth.nil?
          conn.request :url_encoded
          conn.request :json
          conn.response :json
        end

        response = case method
                   when :get
                     connection.get(url) do |req|
                       req.params = data
                       req.headers = headers(@api_key)
                     end
                   when :post
                     connection.post(url) do |req|
                       req.params = data
                       req.headers = headers(@api_key)
                     end
                   when :put
                     connection.put(url) do |req|
                       req.data = data
                       req.headers = headers(@api_key)
                     end
                   when :delete
                     connection.delete(url) do |req|
                       req.data = data
                       req.headers = headers(@api_key)
                     end
                   end

        #follow redirect
        if response.status == 303
          endpoint = response.headers['location']
          endpoint[wikirate_api_url] = ''
          return get(endpoint)
        end

        return response.body unless response.status != 200
        raise(error(response.status, response.body))
      end
    end
  end
end
