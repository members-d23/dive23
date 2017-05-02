class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = top_tweets
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end
  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.create(tweet_params)
    @tweets = top_tweets
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    @tweet.update(tweet_params)
    @tweets = top_tweets
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def delete
    @tweet = Tweet.find(params[:tweet_id])
  end

  def destroy
    @tweet.destroy
    @tweets = top_tweets
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:content).merge(user_id: current_user.id)
    end

    def top_tweets
      Tweet.find_by_sql(['select * from tweets where user_id = ? or user_id in (select followed_id from relationships where follower_id=?) order by created_at desc',current_user, current_user])
    end
end
