class SessionsController < ApplicationController
  def login
  end

  def create
    organization = Organization.find_by_email(params[:email])
    if organization && organization.authenticate(params[:password])
      session[:id] = organization.id
      redirect_to employees_path,
          notice: "Welcome back #{organization.email}"
    else
      flash[:error] = 'Invalid email or password'
      render :login
    end
  end

  def destroy
    if organization = current_organization
      session[:id] = nil
      redirect_to root_path,
        notice: "#{organization.email} has been logged out"
    end
  end
end