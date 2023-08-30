# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'assessment/create' do

  it '査定依頼ページの入力、画面遷移' do
    expect(page).to have_link 'TOP'
  end
end