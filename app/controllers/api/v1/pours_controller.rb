# {
#   tap: 1,
#   volume_oz: 15.5,
#   time: 80085
# }
class Api::V1::PoursController < ApplicationController
  protect_from_forgery :except => :create 

  def create
    Pour.create(pour_params)
    render json: {success: true}, layout: false
  end

  private
  def pour_params
    params.permit(:tap, :volume_oz, :time)
  end
end
