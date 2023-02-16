# frozen_string_literal: true

FactoryBot.define do
  factory :game_rule, class: 'GameRule' do
    player_choice
    computer_choice

    result { GameRule::WIN }

    trait :win_type do
      result { GameRule::WIN }
    end

    trait :lose_type do
      result { GameRule::LOSE }
    end

    trait :tie_type do
      result { GameRule::TIE }
    end
  end
end
