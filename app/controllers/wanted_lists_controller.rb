class WantedListsController < ApplicationController
    skip_before_action :authenticate_user!, only: %i(index show)
    before_action :authorize_wanted_list

    def index
        @all_wanted = WantedList.all
    end

    def show
        @one_wanted = WantedList.find(params[:id])
    end

    def new
        @one_wanted = WantedList.new
    end

    def create
        @one_wanted = WantedList.new(wanted_list_params)

        if @one_wanted.save
            redirect_to @one_wanted
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @one_wanted = WantedList.find(params[:id])
    end

    def destroy
        @one_wanted.destroy
        
        redirect_to root_path, status: :see_other
    end

    private


        def wanted_list_params
            params.require(:wanted_list).permit(:description, :car_info_id, :registation_info_id)
        end

        def authorize_wanted_list
            authorize!(@one_wanted || WantedList.new)
        end
end

class WantedListsController < ApplicationController
    skip_before_action :authenticate_user!, only: %i(index show)
    before_action :authorize_wanted_list
    before_action :find_one_wanted, except: [:index, :new, :create]
  
    def index
      @all_wanted = WantedList.all
    end
  
    def new
      @one_wanted = WantedList.new
    end
  
    def create
      @one_wanted = WantedList.new(wanted_list_params)
      if @one_wanted.valid?
        @one_wanted.save
        redirect_to action: :index
      else
        render 'new'
      end
    end
  
    def edit
    end
  
    def update
      @one_wanted.assign_attributes(wanted_list_params)
  
      if @one_wanted.valid?
        @one_wanted.save
        redirect_to action: :index
      else
        render 'edit'
      end
    end
  
    def destroy
      @one_wanted.destroy
      redirect_to action: :index
    end
  
    private
  
    def authorize_wanted_list
      authorize!(@one_wanted || WantedList.new)
    end
  
    def find_one_wanted
      @one_wanted = WantedList.find(params[:id])
    end
  
    def wanted_list_params
      params.require(:wanted_list).permit(:description, :car_info_id, :registation_info_id)
    end
  end
  
