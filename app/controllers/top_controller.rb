class TopController < ApplicationController
  def index
    @lists = List.where(user: current_user).order("created_at ASC")
    @user = User.find_by(params[:id])
    if @user == current_user
      @lists = @user.lists.rank(:row_order)
    else
      @lists = @user.lists.where(opened: "1")
    end
  end

end
