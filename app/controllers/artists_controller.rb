class ArtistsController < ApplicationController

    def show
        @artist = Artist.find(params[:id])
    end

    def new 
        @artist = Artist.new
    end 

    def create 
        @artist = Artist.new(artist_params(:name, :bio))
        if @artist.save
            redirect_to artist_path(@artist)
        else
            render new
        end
    end 

    def edit 
        @artist = Artist.find(params[:id])
    end 

    def update 
        @artist = Artist.find(params[:id])
        if @artist.update(artist_params(:name, :bio))
            redirect_to artist_path(@artist)
        else 
            render edit
        end
    end

    private 

    def artist_params(*args)
        params.require(:artist).permit(*args)
    end 
end
