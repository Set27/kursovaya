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
        @registation = RegistationInfo.new(holder_params)
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
        @registation.assign_attributes(registation)
    
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

  def authorize_holder
    authorize!(@registation || RegistationInfo.new)
  end

  def find_holder
    @registation = RegistationInfo.find(params[:id])
  end

  def registation_params
    params.require(:registation_info).permit(::state_number, :date_of_registation)
  end
end

end
