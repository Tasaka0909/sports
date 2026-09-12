class TweetsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

   def index
      if params[:search] != nil && params[:search] != ''
        search = params[:search]
        @tweets = Tweet.joins(:user).where(" category LIKE ? OR time LIKE ? OR comment LIKE ?", "%#{search}%", "%#{search}%","%#{search}%")
      else
        @tweets = Tweet.all
      end
  end

  def new
   @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to user_path(current_user), notice: "投稿しました"
    else
      render :new
    end
  end

  def edit
   @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      # 保存に成功したらマイページへリダイレクト
      redirect_to user_path(current_user), notice: "更新しました"
    else
      # 保存に失敗したら編集画面を再表示
      render :edit
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments
    @comment = Comment.new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

   private
  def tweet_params
    params.require(:tweet).permit(:category, :name, :other, :time, :calorie, :comment, :start_time)
  end
 end
