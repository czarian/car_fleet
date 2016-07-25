class MileagesController < ApplicationController

  before_action :authenticate_user!,  only: [:create]

  def index
  end

  def create
     @mileage = Mileage.new(mileage_params)
     @mileage.user = current_user
     @mileage.year = Date.today.year

    if @mileage.save
      redirect_to car_path(@mileage.car)
    else
      flash[:notice] = "There is an error try again later"
      redirect_to cars_path
    end
  end



  private
  def mileage_params
      params.require(:mileage).permit(:value, :car_id, :month)
  end
end
