class TopController < ApplicationController
  def index
    @user = User.find_by(id: current_user.id)
    if @user == current_user
      @lists = List.where(user: current_user).rank(:row_order)
    else
      @lists = List.where(user: current_user).order("created_at ASC")
    end
  end

end
