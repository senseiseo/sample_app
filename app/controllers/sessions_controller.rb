class SessionsController < ApplicationController
  def new
  end
  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user

      # Осуществить вход пользователя и перенаправление на страницу профиля.
    else
      # Выдать сообщение об ошибке.
      flash.now[:danger] = 'Invalid email/password combination' # Не совсем верно!
      render 'new'
  end 
end
  def destroy
    log_out
    redirect_to root_url
  end

end
