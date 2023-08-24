# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City do
  pending "add some examples to (or delete) #{__FILE__}"
  describe 'バリデーションのテスト' do
    it '名前,読みが入力されている場合に有効であること' do
      ciry = build(:city)
      expect(ciry).to be_valid
    end

    it '名前が空欄になっている場合に無効であること' do
      ciry = build(:city, name: nil)
      ciry.valid?
      expect(ciry.errors[:name]).to include("can't be blank")
    end

    it '読みが空欄になっている場合に無効であること' do
      ciry = build(:city, yomi: nil)
      ciry.valid?
      expect(ciry.errors[:yomi]).to include("can't be blank")
    end
  end

  describe 'アソシエーションのテスト' do
    it 'Prefectureとの関係がN：1になっているこよ' do
      expect(described_class.reflect_on_association(:prefecture).macro).to eq :belongs_to
    end
  end
end
