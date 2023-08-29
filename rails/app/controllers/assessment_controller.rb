# frozen_string_literal: true

class AssessmentController < ApplicationController
  def assessment; end

  def new
    @assessment_request = AssessmentRequest.new
  end
end
