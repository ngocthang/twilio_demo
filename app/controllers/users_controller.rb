class UsersController < ApplicationController
  def index
    @user = User.first
    render json: @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_or_create_by(name: params[:user][:name], phone_number: params[:user][:phone_number])
    @user.generate_pin
    @user.send_pin
    respond_to do |format|
      format.js # render app/views/phone_numbers/create.js.erb
    end
  end

  def verify
    @user = User.where(phone_number: params[:hidden_phone_number]).last
    @user.verify(params[:pin])
    respond_to do |format|
      format.js
    end
  end
end
