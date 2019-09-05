# frozen_string_literal: true

class Admin::TeachersController < Admin::BaseController
  add_breadcrumb 'Викладачі', :admin_teachers_path

  before_action :set_teacher, only: [:edit, :update, :destroy]

  def index
    @teachers = Teacher.order(id: :desc).page(params[:page])
  end

  def new
    add_breadcrumb "Новий викладач", new_admin_teacher_path

    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to admin_teachers_path, notice: 'Викладач успішно сворений'
    else
      add_breadcrumb "Новий викладач", new_admin_teachers_path

      flash[:alert] = 'Не вдалося успішно створити викладача'
      render :new
    end
  end

  def edit
    add_breadcrumb "Редактировать #{@teacher.full_name}", [:edit, :admin, @teacher]
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to admin_teachers_path, notice: 'Викладача успішно відредаговано'
    else
      add_breadcrumb "Редактировать #{@teacher.full_name}", [:edit, :admin, @teacher]

      flash[:alert] = 'Не вдалося відредагувати викладача'
      render :edit
    end
  end

  def destroy;
    if @teacher.destroy
      redirect_to admin_teachers_path, notice: 'Викладач успішно видалений'
    else
      flash[:alert] = 'Не вдалося видалити викладача'
      render :new
    end
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def set_active_main_menu_item
    @main_menu[:teachers][:active] = true
  end

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :description)
  end

end
