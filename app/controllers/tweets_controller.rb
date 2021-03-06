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

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.message = params[:tweet][:message]
    if @tweet.save
      redirect_to @tweet
    else
      render :edit
    end
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      if User.exists?(user_name: params[:tweet][:user_name])
        update_user = User.find_by(user_name: params[:tweet][:user_name])
        user_current_msg_count = update_user.message_count
        update_user.message_count = (user_current_msg_count + 1)
        update_user.save
      else
        new_user = User.new
        new_user.user_name = params[:tweet][:user_name]
        new_user.message_count = 1
        new_user.save
      end
      redirect_to @tweet
    else
      render :new
    end
  end

  def destroy
    Tweet.destroy(params[:id])
    @tweet = Tweet.new
    redirect_to @tweet
  end

  private

  def tweet_params
    params.require(:tweet).permit(:user_name, :message, :id)
  end
end
