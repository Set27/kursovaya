class CarComplaintsController < ApplicationController
  before_action :find_complaint, except: [:index, :new, :create]
  before_action :authorize_complaint

    def index
        @complaints = CarComplaint.all
    end
    
      def new
        @complaint = CarComplaint.new
      end
    
      def create
        @complaint = CarComplaint.new(complaint_params)
        if @complaint.valid?
          @complaint.save
          redirect_to action: :index
        else
          render 'new'
        end
      end
    
      def edit
      end
    
      def update
        @complaint.assign_attributes(complaint_params)
    
        if @complaint.valid?
          @complaint.save
          redirect_to action: :index
        else
          render 'edit'
        end
      end
    
      def destroy
        @complaint.destroy
        redirect_to action: :index
      end

  private

  def authorize_complaint
    authorize!(@complaint || CarComplaint.new)
  end

  def find_complaint
    @complaint = CarComplaint.find(params[:id])
  end

  def complaint_params
    params.require(:car_complaint).permit(:address,:description,:date)
  end

end
