# frozen_string_literal: true

class Choice < ApplicationRecord
  validates :id_name, presence: true
end
