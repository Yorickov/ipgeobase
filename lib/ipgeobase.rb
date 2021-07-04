# frozen_string_literal: true

require 'ostruct'
require_relative 'ipgeobase/version'
require_relative 'ipgeobase/http_service'

module Ipgeobase
  URL = 'http://ip-api.com'
  RESPONSE_FORMAT = 'xml'
  FAILED_MESSAGE = 'Invalid IP'

  class Error < StandardError; end

  class << self
    def lookup(ip)
      response = HttpService.new(ip).call
      return FAILED_MESSAGE unless response

      format_result(response)
    end

    private

    def format_result(res)
      OpenStruct.new(city: res.city,
                     country: res.country,
                     country_code: res.country_code,
                     lat: res.lat,
                     lon: res.lon)
    end
  end
end
