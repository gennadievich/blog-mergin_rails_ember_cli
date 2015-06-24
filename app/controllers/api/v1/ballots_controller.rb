class Api::V1::BallotsController < ApplicationController
  respond_to :json

  def show
    render json: Ballot.first
  end

  def swap
    ballot = Ballot.find(params[:ballot_id])
    ballot.swap(LineItem.find(params[:li1]), LineItem.find(params[:li2]))
    if ballot.save
      render json: {}
    else
      render status: 500
    end
  end
end
