require Rails.root.join( "lib/sms_sender").to_s
class SessionsController < ApplicationController  
  def new
    user.phones.build
  end

  def create
    sms_login = Rails.application.credentials.svitsms[:login]
    sms_password = Rails.application.credentials.svitsms[:password]
    @user = User.joins(:phones).find_by(user_phones: { number: params[:number] })
    @user ||= User.create(user_params)
    if @user.valid?
      session[:phone] = @user.phones.first.number
      sms = SmsSender.new(@user.phones.first.number, @user.phones.first.code, sms_login, sms_password)
      sms.send_sms
    else
      render(:new)
    end
  end

  def update
    user = UserPhone.find_by(code: params[:code], number: session[:phone])
    if user
      session[:user_id] = user.user_id
      user.update(code: nil)
      redirect_to :root
    else
      render :create
    end
  end

  def destroy
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:email, phones_attributes: [:number])
  end

  def user
    @user ||= User.new(user_params)
  end
  helper_method :user
end
