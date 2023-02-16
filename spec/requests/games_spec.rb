# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'employee', type: :request do
  path '/choices' do
    get 'Get Available Choices' do
      tags 'Game'
      consumes 'application/json'

      response '200', 'OK' do
        run_test!
      end
    end
  end

  path '/play' do
    post 'Play Game' do
      tags 'Game'
      consumes 'application/json'

      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          player_choice: { type: :string }
        },
        required: [:player_choice]
      }

      response '200', 'ok' do
        before do
          @choice1 = FactoryBot.create(:choice)
          @choice2 = FactoryBot.create(:choice)
          FactoryBot.create(:game_rule, :win_type, player_choice: @choice1, computer_choice: @choice2)
          stub_request(:get, External::CurbService.url).to_return(
            body: { statusCode: 200, body: @choice2.id_name }.to_json.to_s, status: 200
          )
        end

        let(:params) { { player_choice: @choice1.id_name } }
        run_test!
      end
    end
  end
end
