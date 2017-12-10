module StubAPI
  def stub_api(uri: nil, method: :get, body: nil, raw_body: nil)
    uri ||= /#{Hackattic::API::BASE}/
    stub_request(method, uri).tap do |stub|
      body = body ? load_fixture(body) : raw_body
      stub.to_return(body: body) if body
    end
  end

  def load_fixture(path)
    real_path = path.split('/')
    real_path = "#{real_path[0]}/test/fixtures/#{real_path[1]}"
    File.read real_path
  end
end
