class FavoritesController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @user_id = current_user.id
    @tweet = Tweet.find(params[:id])
    @tweet_id = @tweet.id
    @favorite = Favorite.new(tweet_id: @tweet_id, user_id: @user_id )

    if @favorite.save
      respond_with @tweet
    end
  end

  def destroy
    @user_id = current_user.id
    @tweet = Tweet.find(params[:id])
    @tweet_id = @tweet.id
    @favorite = Favorite.find_by(tweet_id: @tweet_id, user_id: @user_id )

    if @favorite.destroy
      respond_with @tweet
    end
  end
end
