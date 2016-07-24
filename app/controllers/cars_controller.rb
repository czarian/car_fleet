class CarsController < ApplicationController

  before_action :authenticate_user!,  only: [:create]

  def index
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create

    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to @car
    else
      render 'new'
    end
  end

  private

  def car_params
    params.require(:car).permit(:brand, :reg_number)
  end

end
