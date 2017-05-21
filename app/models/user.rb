require 'koala'
class User < ApplicationRecord
  validates_presence_of :name, :fbid
  def self.koala(auth)
    access_token = auth
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,picture")
  end
end
