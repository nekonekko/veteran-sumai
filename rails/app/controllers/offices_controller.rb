# frozen_string_literal: true

class OfficesController < ApplicationController
  def show
    # TODO: 存在しないidにアクセスした場合の処理は issue #65 で追加予定
    # issueのリンク：https://github.com/speee/hr-eng-internship-2023-1st-team-summer-tech-circle/issues/65
    @office = Office.find(params[:id])
    @speed_evaluation_mean = @office.calculate_review_mean(response: false, price: false)
    @response_evaluation_mean = @office.calculate_review_mean(speed: false, price: false)
    @price_evaluation_mean = @office.calculate_review_mean(speed: false, response: false)
    @total_evaluation_mean = @office.calculate_review_mean
  end
end
