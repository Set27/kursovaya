class CarInfosController < ApplicationController
  before_action :authorize_car

  def index
    @cars = CarInfo.all
  end

  def new
    @car = CarInfo.new
  end

  def create
    @car = CarInfo.new(car_params)
    if @car.valid?
      @car.save
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @car.assign_attributes(car_params)

    if @car.valid?
      @car.save
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  def destroy
    @car.destroy
    redirect_to action: :index
  end

  def registation_infos
    registation_infos = @car.registation_infos.map do |registation_info|
      {
        id: registation_info.id,
        state_number: registation_info.state_number
      }
    end

    render json: registation_infos, status: :ok
  end

  private

  def authorize_car
    authorize!(@car || CarInfo.new)
  end

  def find_car
    @car = CarInfo.find(params[:id])
  end

  def car_params
    params.require(:car_info).permit(:VIN, :brand, :model)
  end
end
