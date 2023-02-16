# frozen_string_literal: true

require 'rails_helper'
require 'rest-client'

RSpec.describe PlayingService do
  subject(:service) { described_class.new(params) }

  let(:choice1) { FactoryBot.create(:choice, id_name: 'rock') }
  let(:choice2) { FactoryBot.create(:choice, id_name: 'paper') }
  let(:choice3) { FactoryBot.create(:choice, id_name: 'scissor') }

  let(:computer_choice) { choice1.id_name }

  before do
    FactoryBot.create(:game_rule, :lose_type, player_choice: choice1, computer_choice: choice2)
    FactoryBot.create(:game_rule, :win_type, player_choice: choice1, computer_choice: choice3)
    FactoryBot.create(:game_rule, :tie_type, player_choice: choice1, computer_choice: choice1)

    stub_request(:get, External::CurbService.url).to_return(
      body: { statusCode: 200, body: computer_choice }.to_json.to_s, status: 200
    )

    service.play
  end

  let(:params) { { player_choice: choice } }

  context 'when user inputs invalid choice' do
    let(:choice) { Faker::Name.name }

    it 'should write an errors in service class' do
      expect(service.errors.empty?).to be false
    end
  end

  context 'when user inputs valid choice' do
    context 'when user wins' do
      let(:choice) { choice1.id_name }
      let(:computer_choice) { choice3.id_name }

      it 'renders user winning response' do
        expect(service.json_view).to include(computer_choice:, game_result: GameRule::WIN)
      end
    end

    context 'when user loses' do
      let(:choice) { choice1.id_name }
      let(:computer_choice) { choice2.id_name }

      it 'renders user losing response' do
        expect(service.json_view).to include(computer_choice:, game_result: GameRule::LOSE)
      end
    end

    context 'when game ends tie' do
      let(:choice) { choice1.id_name }
      let(:computer_choice) { choice1.id_name }

      it 'renders user winning response' do
        expect(service.json_view).to include(computer_choice:, game_result: GameRule::TIE)
      end
    end
  end
end
