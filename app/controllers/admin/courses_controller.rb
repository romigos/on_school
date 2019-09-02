class Admin::CoursesController < Admin::BaseController
  add_breadcrumb 'Курси', :admin_courses_path

  before_action :set_course, only: [:edit, :update, :destroy]

  def index
    @courses = Course.order(id: :desc).page(params[:page])
  end

  def new
    add_breadcrumb "Новий курс", new_admin_course_path
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to admin_courses_path, notice: 'Курс успішно створений'
    else
      add_breadcrumb "Новий курс", new_admin_course_path

      flash[:alert] = 'Не вдалося успішно створити курс'
      render :new
    end
  end

  def edit
    add_breadcrumb "Редактувати #{@course.name}", [:edit, :admin, @course]
  end

  def update
    if @course.update(course_params)
      redirect_to admin_courses_path, notice: 'Курс успішно відредаговано'
    else
      add_breadcrumb "Редактувати #{@course.name}", [:edit, :admin, @course]

      flash[:alert] = 'Не вдалося відредагувати курс'
      render :edit
    end
  end

  def destroy
    if @course.destroy
      redirect_to admin_courses_path, notice: 'Курс успішно видалений'
    else
      flash[:alert] = 'Не вдалося видалити курс'
      render :new
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def set_active_main_menu_item
    @main_menu[:courses][:active] = true
  end

  def course_params
    params.require(:course).permit(:name, :teacher_id, :discipline_id)
  end
end
