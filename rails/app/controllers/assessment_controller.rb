# frozen_string_literal: true

class AssessmentController < ApplicationController
  def show; end

  def new
    @assessment_request = AssessmentRequest.new
  end
end
