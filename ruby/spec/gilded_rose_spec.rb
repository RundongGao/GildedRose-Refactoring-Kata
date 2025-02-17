# frozen_string_literal: true

require 'rspec'

require './gilded_rose'
require 'pry'
require 'factory_bot'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.find_definitions

describe GildedRose do
  let(:regualr_item) { build(:item) }
  let(:gilde) { GildedRose.new(items) }

  describe '#update_quality' do
    let(:items) { [regualr_item] }
    it 'does not change the name' do
      gilde.update_quality

      expect(gilde.items[0].name).to eq regualr_item.name
    end

    context 'regular item' do
      context 'sell_in greater than 0' do
        let(:regualr_item) { build(:item, sell_in: 2) }
        it 'descrese quality by 1' do
          quality = regualr_item.quality
          gilde.update_quality

          expect(gilde.items[0].quality).to eq(quality - 1)
        end
      end

      context 'sell_in less or equal to 0' do
        let(:regualr_item) { build(:item, sell_in: 0) }
        it 'descrese quality by 2' do
          quality = regualr_item.quality
          gilde.update_quality

          expect(gilde.items[0].quality).to eq(quality - 2)
        end
      end
    end
  end
end
