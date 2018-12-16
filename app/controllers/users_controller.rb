class UsersController < ApplicationController
before_action :require_user
	def new
	end

	def create
	end

	def update
	end

	def edit
		@user = current_user
   	@user.update_attributes(user_params)
	end

	def add_number
		@user = current_user
		@user.update_attributes(user_params)
		#@user.update(phones_attributes)
	end

	def show
		@user = current_user
	end

	def destroy
		@user = current_user
  	@user.phones.first.destroy
  	@user.destroy

  	redirect_to :root
	end

end

  private

  def user_params
   params.fetch(:user, {}).permit(:email, phones_attributes: [:number])
  end
