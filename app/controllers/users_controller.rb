class UsersController < ApplicationController

	def index
    if current_user
      @client = TwitterConnection.new(current_user).create_client
    end
  end

 

end
