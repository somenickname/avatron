class ApiController < ActionController::Base
  respond_to :json

  def show
    # Digest::MD5.hexdigest('foobar')
    user_phone = UserPhone.find_by(hash: params[:hash])
  end
end