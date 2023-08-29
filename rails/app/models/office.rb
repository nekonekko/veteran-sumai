# frozen_string_literal: true

class Office < ApplicationRecord
  belongs_to :company
  belongs_to :prefecture
  belongs_to :city
  has_many :assessment_areas, dependent: :destroy

  validates :ieul_office_id, presence: true, uniqueness: true
  validates :logo_url, presence: true
  validates :address, presence: true
  validates :catch_copy, presence: true
  validates :introduction, presence: true

  def calculate_review_mean(include_speed: true, include_response: true, include_price: true)
    # officeの店舗の口コミの満足度の平均値を計算する
    # include_speed, include_response, include_priceはそれぞれ、売却スピードの満足度、対応満足度、売却価格の満足度を
    # 計算に含めるかどうかを指定する
    # 3つともfalseにするとエラーが出るようにしてあります

    reviews = Review.where(office: self)

    if reviews.empty?
      # TODO: errorを出すほどではないと思うので、warningを出しつつ0を返したかった
      #       warningの出し方がわからなかったので0を返すだけになっています

      return 0
    end

    if include_speed == false && include_response == false && include_price == false
      raise ArgumentError, '少なくとも1つはtrueにしてください！'
    end

    sum = 0.0
    reviews.each do |review|
      sum += review.sale_speed_evaluation if include_speed
      sum += review.company_response_evaluation if include_response
      sum += review.sale_price_evaluation if include_price
    end

    sum /= reviews.length

    num_of_points = 0
    num_of_points += 1 if include_speed
    num_of_points += 1 if include_response
    num_of_points += 1 if include_price

    sum / num_of_points
  end
end
