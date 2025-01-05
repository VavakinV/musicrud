class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    length_in_seconds = parse_length(params[:song][:length])
    params[:song][:length] = length_in_seconds if length_in_seconds

    @song = Song.new(song_params)

    if @song.save
      redirect_to @song, notice: "Song was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :length, :order_in_release, :release_id)
  end

  def parse_length(length)
    return unless length.present?

    if length.match(/^(\d+):(\d{2})$/)
      minutes, seconds = length.split(":").map(&:to_i)
      return (minutes * 60) + seconds
    else
      errors.add(:length, "must be in the format MM:SS")
      nil
    end
  end
end
