class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show edit update]

  def index
    @artists = Artist.all
  end

  def show
    @releases = @artist.releases.order(date_of_release: :asc)
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to @artist, notice: "Artist was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      redirect_to @artist
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.expect(artist: [:name])
  end
end
