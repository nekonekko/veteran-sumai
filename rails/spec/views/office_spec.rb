# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'offices/show', type: :view do
  let(:company) { build(:company) }
  let(:office) { build(:office) }

  before do
    assign(:office, office)
  end

  it 'render correct office info' do
    office.company = company
    render
    expect(rendered).to have_selector('h1', text: 'SPeee不動産 赤坂店')
    expect(rendered).to have_selector('h2', text: '不動産の売却はSpeee1不動産にお任せください')
  end
end
