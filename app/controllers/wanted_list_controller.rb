class WantedListController < ApplicationController
    def index
        @all_wanted = WantedList.all
    end

    def show
        @one_wanted = WantedList.find(params[:id])
    end
end
