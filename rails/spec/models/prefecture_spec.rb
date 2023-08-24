require 'rails_helper'

RSpec.describe Prefecture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe "バリデーションのテスト" do
    it "名前が入力されている場合に有効であること" do
      pre = FactoryBot.build(:prefecture)
      expect(pre).to be_valid
    end

    it "名前が空欄になっている場合に無効であること" do
      pre = FactoryBot.build(:prefecture, name: nil)
      pre.valid?
      expect(pre.errors[:name]).to include("can't be blank")
    end
  end

  describe "アソシエーションのテスト" do
    it "複数のCityを持つこと" do
      association = described_class.reflect_on_association(:cities)
      expect(association.macro).to eq(:has_many)
    end

    it "Cityが削除されると、関連するCity削除されること" do
      pre = FactoryBot.create(:prefecture)
      city = FactoryBot.create(:city, prefecture: pre)

      expect { pre.destroy }.to change(City, :count).by(-1)
    end
  end
end
