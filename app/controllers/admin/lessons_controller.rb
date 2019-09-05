class Admin::LessonsController < Admin::BaseController

  before_action :set_course
  before_action :set_lesson, only: [:edit, :update, :destroy]

  def index
    @lessons = @course.lessons.order(id: :desc).page(params[:page])
  end

  def new
    add_breadcrumb "Новий урок", [:new, :admin, @course, :lesson]
    @lesson = @course.lessons.build
  end

  def create
    @lesson = @course.lessons.build(lesson_params)

    if @lesson.save
      redirect_to admin_lessons_path, notice: 'урок успішно створений'
    else
      add_breadcrumb "Новий урок", [:new, :admin, @course, :lesson]

      flash[:alert] = 'Не вдалося успішно створити урок'
      render :new
    end
  end

  def edit
    add_breadcrumb "Редактувати #{@lesson.name}", [:edit, :admin, @course, @lesson]
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to admin_lessons_path, notice: 'урок успішно відредаговано'
    else
      add_breadcrumb "Редактувати #{@lesson.name}", [:edit, :admin, @course, @lesson]

      flash[:alert] = 'Не вдалося відредагувати урок'
      render :edit
    end
  end

  def destroy
    if @lesson.destroy
      redirect_to admin_lessons_path, notice: 'урок успішно видалений'
    else
      flash[:alert] = 'Не вдалося видалити урок'
      render :new
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
    add_breadcrumb 'eerrrR', :admin_course_url
    add_breadcrumb @course.name, [:admin, @course, :lessons]
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def set_active_main_menu_item
    @main_menu[:courses][:active] = true
  end

  def lesson_params
    params.require(:lesson).permit(:name, :description)
  end
end
