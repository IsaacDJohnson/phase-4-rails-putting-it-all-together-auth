class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response
  before_action :authorize

  private

  def authorize
    @user = User.find_by(id: session[:user_id])
    render json: { errors: [ "Not Authorized" ] }, status: :unauthorized unless @user
  end

  def unprocessable_entity_response(arg)
    render json: { errors: arg.record.errors.full_messages }, status: :unprocessable_entity
  end

end
