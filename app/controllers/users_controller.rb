class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    # params[:id] があればそのユーザーを、無ければログイン中の自分を取得
    @user = params[:id].present? ? User.find_by(id: params[:id]) : current_user

    # 該当するユーザーが存在しない場合の安全策
    unless @user
      redirect_to root_path, alert: "ユーザーが見つかりませんでした。" and return
    end

    if params[:search].present?
      search = "%#{params[:search]}%"
      @tweets = @user.tweets.where(
        "category LIKE :search OR
         name LIKE :search OR
         comment LIKE :search OR
         other LIKE :search OR
         CAST(calorie AS VARCHAR) LIKE :search",
        search: search
      )
    else
      @tweets = @user.tweets
    end
  end
end