# frozen_string_literal: true

class Office < ApplicationRecord
  belongs_to :company
  belongs_to :prefecture
  belongs_to :city
  has_many :assessment_areas, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :ieul_office_id, presence: true, uniqueness: true
  validates :logo_url, presence: true
  validates :address, presence: true
  validates :catch_copy, presence: true
  validates :introduction, presence: true

  def calculate_review_mean(speed: true, response: true, price: true)
    # officeの店舗の口コミの満足度の平均値を計算する
    # speed, response, priceはそれぞれ、売却スピードの満足度、対応満足度、売却価格の満足度を
    # 計算に含めるかどうかを指定する
    # 3つともfalseにするとエラーが出るようにしてあります

    if reviews.empty?
      # TODO: errorを出すほどではないと思うので、warningを出しつつ0を返したかった
      #       warningの出し方がわからなかったので0を返すだけになっています

      return 0
    end

    raise ArgumentError, '少なくとも1つはtrueにしてください！' if speed == false && response == false && price == false

    sum = 0.0
    reviews.each do |review|
      sum += review.sale_speed_evaluation if speed
      sum += review.company_response_evaluation if response
      sum += review.sale_price_evaluation if price
    end

    sum /= reviews.length

    num_of_points = 0
    num_of_points += 1 if speed
    num_of_points += 1 if response
    num_of_points += 1 if price

    sum / num_of_points
  end
end
