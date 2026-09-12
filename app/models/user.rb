class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy 
  has_one_attached :image 
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 } 

  # 継続日数を計算するメソッド
  def streak_days
    # start_time の日付（年月日）を取得して重複排除＆降順ソート
    # ※ start_time が nil のデータは除外
    posted_dates = tweets.where.not(start_time: nil).pluck(:start_time).map(&:to_date).uniq.sort.reverse
    return 0 if posted_dates.empty?

    today = Date.current
    yesterday = Date.current.yesterday

    # 最新の運動記録が「今日」でも「昨日」でもない場合は継続が途切れているので 0 日
    return 0 unless posted_dates.include?(today) || posted_dates.include?(yesterday)

    streak = 0
    check_date = posted_dates.include?(today) ? today : yesterday

    # 1日ずつ遡って連番になっているか判定
    while posted_dates.include?(check_date)
      streak += 1
      check_date -= 1.day
    end

    streak
  end
end