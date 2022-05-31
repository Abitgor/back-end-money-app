module JwtSupport
  def get_headers(login, password)
    jwt = get_jwt(login, password)
    {
      Accept: 'application/json',
      'Content-Type': 'application/json',
      HTTP_JWT_AUD: 'test',
      Authorization: jwt
    }
  end

  def get_jwt(login, password)
    headers = { HTTP_JWT_AUD: 'test' }
    post '/api/login', params: { user: { email: login, password: password } }, headers: headers, as: :json
    response.header["Authorization"]
  end
end

RSpec.configure do |config|
  config.include JwtSupport
end