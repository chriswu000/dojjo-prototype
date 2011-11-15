class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
    @entries = @user.entries
    @date = params[:month] ? Date.parse(params[:month]) : Date.today

    # FILTERS
    @filter_text = "all"
    if params[:filter_date]
      @filter_text = params[:filter_date]
      @entries_to_show = @user.entries.filter_date(params[:filter_date])
    else
      @entries_to_show = @entries
    end
  end

end
