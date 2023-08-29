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

  def calculate_review_mean(office, include_speed: true, include_response: true, include_price: true)
    # officeの店舗の口コミの満足度の平均値を計算する
    # include_speed, include_response, include_priceはそれぞれ、売却スピードの満足度、対応満足度、売却価格の満足度を
    # 計算に含めるかどうかを指定する
    # 3つともfalseにするとエラーが出るようにしてあります

    reviews = Review.where(office: office)

    if reviews.length == 0
      raise RuntimeError, 'この店舗にはまだ口コミが存在しません！'
    end

    if include_speed == false && include_response == false && include_price == false
      raise ArgumentError, '少なくとも1つはtrueにしてください！'
    end

    sum = 0.0
    reviews.each do |review|
      if include_speed
        sum += review.sale_speed_evaluation
      end
      if include_response
        sum += review.company_response_evaluation
      end
      if include_price
        sum += review.sale_price_evaluation
      end
    end

    sum /= reviews.length

    num_of_points = 0
    if include_speed
      num_of_points += 1
    end
    if include_response
      num_of_points += 1
    end
    if include_price
      num_of_points += 1
    end

    return sum / num_of_points
  end
end
