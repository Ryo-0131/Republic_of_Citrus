class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  before_action :set_search_index

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: %i[nickname prefecture_id favorite_id introduction image]
    )
  end

  def set_search
    @search = Item.ransack(params[:q])
    @search_items = @search.result
    @check = params[:q]
  end

  def set_search_index
    @search_index = Item.ransack(params[:q])
    @search_index_items = @search.result
    @check = params[:q]
  end

end