require "ekispert/version"

require 'ekispert/client'

module Ekispert
  API_BASE = 'https://api.ekispert.jp'.freeze
  API_VERSION = '/v1'.freeze
  API_FORMAT = '/json'.freeze

  API_URL = API_BASE + API_VERSION + API_FORMAT

  class << self
    attr_accessor :api_key
  end
end
