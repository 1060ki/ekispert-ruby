require 'faraday'
require 'json'

require_relative 'error/bad_request'
require_relative 'error/forbidden'
require_relative 'error/internal_error'
require_relative 'error/not_found'

module Ekispert
  class Client
    attr_reader :connection

    def initialize(api_key: nil)
      api_key ||= Ekispert.api_key

      uri = URI.parse(Ekispert::API_URL)
      uri.query = URI.encode_www_form(key: api_key)

      @connection ||= Faraday.new(uri) do |conn|
        conn.adapter Faraday.default_adapter
      end
    end

    def get(path, **args)
      args.delete_if { |_k, v| v.blank? }
      response = connection.get(path, args)

      case response.status
      when 200
        JSON.parse(response.body)
      when 400
        raise Ekispert::Error::BadRequest, response.body
      when 403
        raise Ekispert::Error::Forbidden, response.body
      when 404
        raise Ekispert::Error::NotFound, response.body
      when 500..599
        raise Ekispert::Error::InternalError, response.body
      else
        raise Faraday::ClientError
      end
    end
  end
end
