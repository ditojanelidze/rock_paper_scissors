# frozen_string_literal: true

require 'rails_helper'
require 'rest-client'

RSpec.describe External::CurbService do
  subject(:service_result) { described_class.call }

  context 'when external api returns successful response' do
    before do
      stub_request(:get, 'https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw').to_return(
        body: '{"statusCode": 200,"body": "rock"}', status: 200
      )
    end

    it 'should be successful' do
      expect(service_result[:success]).to be true
      expect(service_result[:choice]).to eq 'rock'
    end
  end

  context 'when external api returns error' do
    before do
      stub_request(:get, 'https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw').to_return(
        body: '{"statusCode": 500,"body": "Error"}', status: 500
      )
    end

    it 'returns error due to error response' do
      expect(service_result[:success]).to be false
      expect(service_result[:message]).to eq '500 Internal Server Error'
    end
  end

  context 'when external api goes on timeout' do
    before do
      stub_request(:get, 'https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw').to_timeout
    end

    it 'returns error due to timeout' do
      expect(service_result[:success]).to be false
      expect(service_result[:message]).to eq 'Timed out connecting to server'
    end
  end
end
