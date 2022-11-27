class RegistationInfosController < ApplicationController
  before_action :find_registation, except: [:index, :new, :create]
  before_action :authorize_registation

    def index
        @registations = RegistationInfo.all
    end
    
      def new
        @registation = RegistationInfo.new
      end
    
      def create
        @registation = RegistationInfo.new(registation_params)
        if @registation.valid?
          @registation.save
          redirect_to action: :index
        else
          render 'new'
        end
      end
    
      def edit
      end
    
      def update
        @registation.assign_attributes(registation_params)
    
        if @registation.valid?
          @registation.save
          redirect_to action: :index
        else
          render 'edit'
        end
      end
    
      def destroy
        @registation.destroy
        redirect_to action: :index
      end

  private

  def authorize_registation
    authorize!(@registation || RegistationInfo.new)
  end

  def find_registation
    @registation = RegistationInfo.find(params[:id])
  end

  def registation_params
    params.require(:registation_info)
      .permit(:state_number, :date_of_registation, :car_holder_info_id, :car_info_id)
  end

end
