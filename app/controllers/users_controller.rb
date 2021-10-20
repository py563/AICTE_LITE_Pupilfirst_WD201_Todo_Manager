# users_controller.rb
class UsersController < ApplicationController
  # for postman to work
  skip_before_action :verify_authenticity_token

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
    name = params[:name]
    email = params[:email]
    password = params[:password]

    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )

    response_text = "Hey, #{name} we have created a user for you with email: #{email}"
    render plain: response_text
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email, password: password)
    response_text = "Wrong Email or Password"

    # if user.present?
    #  response_text = "Hey Welcome #{user.to_pleasant_string}"
    # end
    # render plain: response_text

    render plain: user.present?
  end
end
