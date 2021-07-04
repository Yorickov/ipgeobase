# frozen_string_literal: true

require_relative 'ipgeobase/version'
require_relative 'ipgeobase/http_service'

module Ipgeobase
  URL = 'http://ip-api.com'
  RESPONSE_FORMAT = 'xml'
  FAILED_MESSAGE = 'Invalid IP'

  class Error < StandardError; end

  def self.lookup(ip)
    response = HttpService.new(ip).call
    return FAILED_MESSAGE unless response

    response
  end
end
