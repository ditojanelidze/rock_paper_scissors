module External
  class CurbService
    class << self
      def call
        begin
          response = RestClient::Request.execute(method: :get, url:, headers:, timeout: GAME_TIMEOUT)
          result = {success: true, choice: JSON.parse(response.body)['body']}
        rescue => e
          result = {success: false, message: e.message}
        end
        result
      end

      def url
        'https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw'
      end

      def headers
        { 'Content-Type': 'application/json' }
      end
    end
  end
end