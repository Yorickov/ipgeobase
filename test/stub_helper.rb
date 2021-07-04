# frozen_string_literal: true

module StubHelper
  def stub_http_request(ip, body)
    stub_request(:get, "http://ip-api.com/xml/#{ip}")
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        }
      ).to_return(body: body, headers: {})
  end
end
