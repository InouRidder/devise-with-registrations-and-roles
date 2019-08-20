class RegistrationsController < Devise::RegistrationsController
  def create
    super # execute everything in the original create method
    # then add the user to the registration model.
    if params[:user_type] == 'Driver'
      user = Driver.create
    elsif params[:user_type] == 'Client'
      user = Client.create
    end
    @registration.user = user
    @registration.save
    # this is in dire need of a refactor, but keeping it explicit for now : )
  end
end
