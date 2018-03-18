class ApplicationController < ActionController::Base
  include ExceptionHandler

  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?

  before_action :ensure_panel_provider

  helper_method :current_panel_provider

  protected

  def json_request?
    request.format.json?
  end

  def ensure_panel_provider
    head(:not_found) unless panel_provider_header.present?
  end

  def panel_provider_header
    request.headers['HTTP_PANEL_PROVIDER']
  end

  def current_panel_provider
    @current_panel_provider ||= PanelProvider.find(panel_provider_header)
  end
end
