class FavoritesController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @favorite = Favorite.new(
    tweet_id: params[:tweet_id],
    user_id: current_user.id
  )

  if @favorite.save
    render template: 'tweets/index'
  else
    render template: 'tweets/index'
  end

  def destroy
    @favorite = Favorite.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    @favorite.destroy
    redirect_to tweet_path
  end

end

private
  def favorite_params
    params.require(:favorite).permit(:tweet_id, :user_id)
  end
end
