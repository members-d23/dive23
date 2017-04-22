class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @user_id = current_user.id
    @tweet_id = Tweet.find(params[:id]).id
    @favorite = Favorite.new(tweet_id: @tweet_id, user_id: @user_id )

    if @favorite.save
      redirect_to tweets_path
    end
  end

  def destroy
    @user_id = current_user.id
    @tweet_id = Tweet.find(params[:id]).id
    @favorite = Favorite.find_by(tweet_id: @tweet_id, user_id: @user_id )

    if @favorite.destroy
      redirect_to tweets_path
    end
  end
end
