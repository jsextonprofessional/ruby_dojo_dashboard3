class DojosController < ApplicationController
    def index
        @dojos = Dojo.all
        @count = Dojo.all.count
    end

    def new
    end
    
    def create
        @dojo = Dojo.new(dojo_params)
        if @dojo.save
            flash[:success] = "You did it"
            redirect_to '/dojos'
        else
            flash[:errors] = @dojo.errors.full_messages
            redirect_to '/dojos/new/'
        end
    end

    def show
        @dojo = Dojo.find(params[:id])
    end

    def edit
    end

    private
    def dojo_params
        params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end
