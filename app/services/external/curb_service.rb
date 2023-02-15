module External
  class CurbService
    def self.call

      {choice: ['rock', 'paper', 'scissor'].sample}
    end

    def url
      'https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw'
    end
  end
end