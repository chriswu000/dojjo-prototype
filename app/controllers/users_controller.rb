class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
    @entries = @user.entries
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
  end

end
