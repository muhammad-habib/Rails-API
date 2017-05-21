class PostsController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    access_token = 'EAACEdEose0cBAKWNfs5ge94wMsX7z2XbTO5lnZCZBcZCSsprwNfCEucs2YZC46pLmx83twYnCvH7ZCS3rVlVeSzwkZAEp0twCtMqbbF8OTlmfiFSUJWZAZBVQxrCgQCZCuNtgj6Ydz2467GjKG1dkx82noyQSqhZBwLstiNy4EidvIit2nptYEPgX6'
    facebook = Koala::Facebook::API.new(access_token)
    obj = facebook.get_object("me?fields=posts.limit(5)")
    json_response(obj)
  end

  # POST /todos
  def create
    @todo = User.create!(todo_params)
    json_response(@todo, :created)
  end

  # GET /todos/:id
  def show
    json_response(@todo)
  end

  # PUT /todos/:id
  def update
    @todo.update(todo_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def todo_params
    # whitelist params
    params.permit(:name, :fbid)
  end

  def set_todo
    @todo = User.find(params[:id])
  end
end
