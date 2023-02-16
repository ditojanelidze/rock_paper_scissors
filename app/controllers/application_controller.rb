# frozen_string_literal: true

class ApplicationController < ActionController::API
  def render_response(service)
    if service.errors.any?
      render json: { errors: service.errors }, status: 400
    else
      render json: { data: service.json_view }
    end
  end
end
