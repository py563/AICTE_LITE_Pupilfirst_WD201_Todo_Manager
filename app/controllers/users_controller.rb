# users_controller.rb
class UsersController < ApplicationController
  # for postman to work
  # skip_before_action :verify_authenticity_token

  def index
    response_text = "Hey, below are list of users:"
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end

  def create
    response_text = "Hey, your new todo is create with id"
    render plain: response_text
  end
end
