module Api
  class LocationsController < ApiController
    before_action :set_country

    def index
      @locations = @country.locations

      render json: @locations, status: :ok
    end

    private

    def set_country
      @country = current_panel_provider.countries.find_by!(country_code: params[:country_code])
    end
  end
end
