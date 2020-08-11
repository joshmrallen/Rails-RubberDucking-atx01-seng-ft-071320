class DucksController < ApplicationController
  before_action :find_duck, only: [:show, :edit, :update]


  def index
    @ducks = Duck.all
  end

  def show
    find_duck
  end

  def new
    @duck = Duck.new
  end

  def create
    @duck = Duck.create(duck_params)
    if @duck.valid?
      redirect_to duck_path(@duck)
    else
      flash[:errors] = @duck.errors.full_messages
      redirect_to new_duck_path
    end
  end

  def edit
    find_duck
  end

  def update
    find_duck
    @duck.update(duck_params)
    if @duck.valid?
      redirect_to duck_path(@duck)
    else
      flash[:errors] = @duck.errors.full_messages
      redirect_to edit_duck_path
    end
  end

  private
  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

  def find_duck
    @duck = Duck.find(params[:id])
  end

end

#need to assign ducks from the duck new or edit page