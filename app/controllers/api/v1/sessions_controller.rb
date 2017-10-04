class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by(session_params)
    render json: @user, include: [:movies], status: 201
  end

  private

  def session_params
    params.permit(:username)
  end

end
