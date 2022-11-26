class WantedListsController < ApplicationController
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
        @one_wanted = WantedList.find(params[:id])
        @one_wanted = WantedList.destroy
        
        redirect_to root_path, status: :see_other
    end

    private
        def wanted_list_params
            params.require(:wanted_list).permit(:id)
        end
end
