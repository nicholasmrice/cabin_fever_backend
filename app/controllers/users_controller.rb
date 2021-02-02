class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        render json: User.create(username: params["user"]["username"], password: params["user"]["password"])
    end

end
