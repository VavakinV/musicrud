class SongsController < ApplicationController
  before_action :set_song, only: %i[show edit update destroy]
  before_action :format_length_to_i, only: %i[create update]
  before_action :format_length_to_s, only: %i[edit]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song, notice: "Song was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private
  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :length, :order_in_release, :release_id)
  end

  def format_length_to_i
    length_in_seconds = parse_length(params[:song][:length])
    params[:song][:length] = length_in_seconds if length_in_seconds
  end

  def format_length_to_s
    @song.length = @song.formatted_length
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
