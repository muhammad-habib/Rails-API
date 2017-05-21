class AuthController < ApplicationController

  # POST /Facebook login
  def facebook
    access_token = auth_params['token']
    facebook = Koala::Facebook::API.new(access_token)
    obj = facebook.get_object("me?fields=id,name,picture,email")
    json_response(obj)
  end


  def auth_params
    # whitelist params
    params.permit(:token)
  end
end
