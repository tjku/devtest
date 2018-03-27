module Api
  class TargetGroupsController < ApiController
    before_action :set_country

    def index
      @target_groups = @country.target_groups

      render json: @target_groups, status: :ok
    end

    private

    def set_country
      @country = current_panel_provider.countries.find_by!(country_code: params[:country_code])
    end
  end
end
