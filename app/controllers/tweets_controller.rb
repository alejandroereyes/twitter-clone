class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to @tweet
    else
      render :new
    end
  end

  def destroy

  end

  private

  def tweet_params
    params.require(:tweet).permit(:user_name, :message)
  end
end
