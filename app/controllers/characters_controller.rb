class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
  end

  def create
    # raise
    @new = Character.new(character_params)
    if @new.save
      redirect_to character_path(@new)
    else
      @character = Character.new
      # flash.now[:alert] = "problem"
      render "new"
      # raise
    end
  end

  def show
    # raise
    @character = Character.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destory
  end

  private

  def character_params
    params.require(:character).permit(:name, :race, :character_class, :alignment)
  end
end
