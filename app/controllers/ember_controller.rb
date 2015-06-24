class EmberController < ApplicationController
  def start
    if current_user
      render layout: false
    else
      redirect_to login_path
    end
  end
end
