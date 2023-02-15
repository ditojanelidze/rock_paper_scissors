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
          player_choice: {type: :string}
        },
        required: [:player_choice]
      }

      response '200', 'ok' do
        run_test!
      end
    end
  end
end
