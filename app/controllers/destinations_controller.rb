class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update]
  def index
    @destinations = Destination.all
  end

  def edit
  end

  def update
    @destination.update(destination_params(:name,:country))
    redirect_to destination_path(@destination)
  end

  def show
  end

  def new
    @destination = Destination.new
  end

  def create
    new_destination = Destination.create(destination_params(:name,:country))
    if new_destination.valid?
      redirect_to destination_path(new_destination)
    else
      redirect_to new_destination_path
    end

  end

  private

  def set_destination
    @destination = Destination.find(params[:id])
  end

  def destination_params(*args)
    params.require(:destination).permit(*args)
  end
end
