class Api::V1::UsersController < ApplicationController
  respond_to :json

  def current
    render json: {
      current_user:
      {
        name: current_user.name,
        email: current_user.email,
        id: current_user.id
      }

    }
  end
end
