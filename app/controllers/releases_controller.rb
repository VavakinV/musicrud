class ReleasesController < ApplicationController
  def index
    @releases = Release.all
  end

  def show
    @release = Release.find(params[:id])
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

  private
  def release_params
    params.require(:release).permit(:title, :release_type, :date_of_release, :genre, :language, :artist_id)
  end
end
