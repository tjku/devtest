module Api
  class ApiController < ApplicationController
    include ExceptionHandler

    before_action :ensure_panel_provider
    helper_method :current_panel_provider

    private

    def panel_provider_header
      request.headers['HTTP_PANEL_PROVIDER']
    end

    def ensure_panel_provider
      head(:not_found) unless panel_provider_header.present?
    end

    def current_panel_provider
      @current_panel_provider ||= PanelProvider.find(panel_provider_header)
    end
  end
end
