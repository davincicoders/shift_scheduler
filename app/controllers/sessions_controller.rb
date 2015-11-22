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
end