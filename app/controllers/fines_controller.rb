class FinesController < ApplicationController
  before_action :find_fine, except: [:index, :new, :create]
  before_action :authorize_fine

    def index
        @fines = Fine.all
    end
    
      def new
        @fine = Fine.new
      end
    
      def create
        @fine = Fine.new(fine_params)
        if @fine.valid?
          @fine.save
          redirect_to action: :index
        else
          render 'new'
        end
      end
    
      def edit
      end
    
      def update
        @fine.assign_attributes(fine_params)
    
        if @fine.valid?
          @fine.save
          redirect_to action: :index
        else
          render 'edit'
        end
      end
    
      def destroy
        @fine.destroy
        redirect_to action: :index
      end

  private

  def authorize_fine
    authorize!(@fine || Fine.new)
  end

  def find_fine
    @fine = Fine.find(params[:id])
  end

  def fine_params
    params.require(:fine).permit(:date_of_recepeit,:article,:amount,:registation_info_id)
  end

end
