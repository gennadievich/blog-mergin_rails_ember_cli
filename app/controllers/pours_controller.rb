class PoursController < ApplicationController
  def index
    @pours = Pour.all
    respond_with @pours
  end
end
