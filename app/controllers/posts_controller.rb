class PostsController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    access_token = request.headers['Authorization'].split(' ')[1]
    facebook = Koala::Facebook::API.new(access_token)
    posts = []
    data = facebook.get_object('me?fields=posts.limit(100){comments{comments{from,created_time,message},message,from,created_time},message,likes,created_time}')
    for post in data['posts']['data']
      if posts.length == 10
        break;
      end
      if post['message']
        posts.push post
      end
    end
    json_response(posts)
  end
end
