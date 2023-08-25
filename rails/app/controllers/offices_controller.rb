# frozen_string_literal: true

class OfficesController < ApplicationController
  def show
    # TODO: 存在しないidにアクセスした場合の処理は issue #65 で追加予定
    # issueのリンク：https://github.com/speee/hr-eng-internship-2023-1st-team-summer-tech-circle/issues/65
    @office = Office.find(params[:id])
  end
end
