class CarHolderInfosController < ApplicationController
  before_action :find_holder, except: [:index, :new, :create]
  before_action :authorize_holder

    def index
        @holders = CarHolderInfo.all
    end
    
      def new
        @holder = CarHolderInfo.new
      end
    
      def create
        @holder = CarHolderInfo.new(holder_params)
        if @holder.valid?
          @holder.save
          redirect_to action: :index
        else
          render 'new'
        end
      end
    
      def edit
      end
    
      def update
        @holder.assign_attributes(holder_params)
    
        if @holder.valid?
          @holder.save
          redirect_to action: :index
        else
          render 'edit'
        end
      end
    
      def destroy
        @holder.destroy
        redirect_to action: :index
      end

  private

  def authorize_holder
    authorize!(@holder || CarHolderInfo.new)
  end

  def find_holder
    @holder = CarHolderInfo.find(params[:id])
  end

  def holder_params
    params.require(:car_holder_info).permit(:full_name, :date_of_birth, :date_of_car_license)
  end
end
