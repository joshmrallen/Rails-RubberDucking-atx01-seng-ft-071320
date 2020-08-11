class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update]


  def index
    @students = Student.all
  end

  def show
    find_student
  end

  def new
    @student = Student.new
  end

  def create
    @student = @student.create(student_params)
    if @student.valid?
      redirect_to student_path(@student)
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to new_student_path
    end
  end

  def edit
    find_student
  end

  def update
    find_student
    @student.update(student_params)
    if @student.valid?
      redirect_to student_path(@student)
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to edit_student_path
    end
  end

  private
  def student_params
    params.require(:student).permit(:name, :mod, ducks_attributes: [:name, :description, :student_id])
  end

  def find_student
    @student = Student.find(params[:id])
  end

end
