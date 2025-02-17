# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :item do
    name { Faker::Games::Dota.item }
    sell_in { rand(0..20) }
    quality { rand(0..50) }

    initialize_with { new(name, sell_in, quality) }
  end
end
