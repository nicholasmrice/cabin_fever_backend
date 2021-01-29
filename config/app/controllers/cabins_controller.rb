class CabinsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: Cabin.all
  end

  def show
    render json: Cabin.find(params["id"])
  end

  def create
    render json: Cabin.create(params["cabin"])
  end

  def delete
    render json: Cabin.delete(params["id"])
  end

  def update
    render json: Cabin.update(params["id"], params["cabin"])
end

end
