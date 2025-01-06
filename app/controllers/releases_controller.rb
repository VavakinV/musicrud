class ReleasesController < ApplicationController
  before_action :set_release, only: %i[show edit update destroy]

  def index
    @releases = Release.all
  end

  def show
    @songs = @release.songs.order(:order_in_release)
  end

  def new
    @release = Release.new
  end

  def create
    @release = Release.new(release_params)
    if @release.save
      redirect_to @release, notice: "Release was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @release.update(release_params)
      redirect_to @release
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @release.destroy
    redirect_to releases_path
  end

  private
  def set_release
    @release = Release.find(params[:id])
  end

  def release_params
    params.require(:release).permit(:title, :release_type, :date_of_release, :genre, :language, :artist_id)
  end
end
