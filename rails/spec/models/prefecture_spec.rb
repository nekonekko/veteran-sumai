# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Prefecture do
  describe '#valid?' do
    let(:prefecture) { build(:prefecture, name: name) }

    context 'nameが存在する場合' do
      let(:name) { '北海道' }

      it { expect(prefecture).to be_valid }
    end

    context 'nameがnilの場合' do
      let(:name) { nil }

      it { expect(prefecture).not_to be_valid }
    end
  end
end
