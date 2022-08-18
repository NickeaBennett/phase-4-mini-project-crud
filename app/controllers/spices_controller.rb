class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = spice_find_by_id
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice = spice_find_by_id
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
    
    def spice_find_by_id
        Spice.find_by(id: params[:id])
    end
end
