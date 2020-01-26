class SongsController < ApplicationController
    def show
        @song = Song.find(params[:id])
    end

    def new 
        @song = Song.new
    end 

    def create 
        @song = Song.new(song_params(:name, :artist_id, :genre_id))
        if @song.save
            redirect_to song_path(@song)
        else
            render new
        end
    end 

    def edit 
        @song = Song.find(params[:id])
    end 

    def update 
        @song = Song.find(params[:id])
        if @song.update(song_params(:name, :artist_id, :genre_id
))
            redirect_to song_path(@song)
        else 
            render edit
        end
    end

    def index 
        @songs = Song.all
    end
    
    private 

    def song_params(*args)
        params.require(:song).permit(*args)
    end 
end
