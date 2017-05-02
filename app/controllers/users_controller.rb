class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @active_tab = params[:active_tab]
    @user = User.find(params[:id])
  end
end
