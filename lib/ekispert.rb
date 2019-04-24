require "ekispert/version"

require 'ekispert/client'
require 'ekispert/course'

module Ekispert
  API_BASE = 'https://api.ekispert.jp'.freeze
  API_VERSION = '/v1'.freeze
  API_FORMAT = '/json'.freeze

  API_URL = API_BASE + API_VERSION + API_FORMAT

  class << self
    attr_accessor :api_key

    def client(api_key: nil)
      @client ||= Client.new(api_key: api_key)
    end
  end
end
