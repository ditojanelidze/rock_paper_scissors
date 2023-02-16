# frozen_string_literal: true

FactoryBot.define do
  factory :choice, class: 'Choice' do
    id_name { Faker::Name.name.downcase }
  end

  factory :player_choice, class: 'Choice' do
    id_name { Faker::Name.name.downcase }
  end

  factory :computer_choice, class: 'Choice' do
    id_name { Faker::Name.name.downcase }
  end
end
