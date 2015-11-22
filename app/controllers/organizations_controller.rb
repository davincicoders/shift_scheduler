class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      session[:id] = @organization.id
      redirect_to employees_path,
        notice: "Thank you for signing up!"
    else
      render :new
    end
  end

  private

  def organization_params
    params.require(:organization).permit(
      :name, :address, :city, :state, :zip_code, :phone_number,
      :email, :password, :password_confirmation
    )
  end
end