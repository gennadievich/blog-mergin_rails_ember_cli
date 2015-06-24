class Api::V1::LineItemsController < ApplicationController
  def update
    LineItem.find(params[:id]).update_attributes(line_item_params)
    render status: 200, json: {}, layout: false
  end

  def create
    ballot = Ballot.find(params[:line_item][:ballot_id])
    beer = Beer.create(name: params[:line_item][:beer_name])
    line_item = ballot.line_items.create(beer: beer, weight: params[:line_item][:weight])
    render json: line_item
  end

  private
  def line_item_params
    params[:line_item].permit(:weight)
  end
end
