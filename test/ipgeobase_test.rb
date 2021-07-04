# frozen_string_literal: true

require 'test_helper'

class IpgeobaseTest < Minitest::Test
  include StubHelper

  def setup
    @valid_ip = '8.8.8.8'
    @invalid_ip = 'abcd'
  end

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_success_request
    body =
      '<?xml version="1.0" encoding="UTF-8"?>' \
      '<query>' \
      '<status>success</status>' \
      '<country>United States</country>' \
      '<countryCode>US</countryCode>' \
      '<region>VA</region>' \
      '<regionName>Virginia</regionName>' \
      '<city>Ashburn</city>' \
      '<zip>20149</zip>' \
      '<lat>39.03</lat>' \
      '<lon>-77.5</lon>' \
      '<timezone>America/New_York</timezone>' \
      '<isp>Google LLC</isp>' \
      '<org>Google Public DNS</org>' \
      '<as>AS15169 Google LLC</as>' \
      "<query>#{@valid_ip}</query>" \
      '</query>'

    stub_http_request(@valid_ip, body)

    expected = OpenStruct.new(city: 'Ashburn',
                              country: 'United States',
                              country_code: 'US',
                              lat: '39.03',
                              lon: '-77.5')

    response = Ipgeobase.lookup(@valid_ip)

    assert_equal expected, response
  end

  def test_failed_request
    body =
      '<?xml version="1.0" encoding="UTF-8"?>' \
      '<query>' \
      '<status>fail</status>' \
      '<message>invalid query</message>' \
      "<query>#{@invalid_ip}</query>" \
      '</query>'

    stub_http_request(@invalid_ip, body)

    response = Ipgeobase.lookup(@invalid_ip)

    assert_equal Ipgeobase::FAILED_MESSAGE, response
  end
end
