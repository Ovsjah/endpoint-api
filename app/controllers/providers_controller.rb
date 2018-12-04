class ProvidersController < ApplicationController
  def create
    # debugger
    @provider = Provider.create!(provider_params)
    json_response(@provider, :created)
  end

  private

  def provider_params
    params.permit(:email, :first_name, :last_name, :amount)
  end
end
