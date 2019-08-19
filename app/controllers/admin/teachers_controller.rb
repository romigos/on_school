class Admin::TeachersController < Admin::BaseController
  def index
    @teachers = Teacher.order(id: :desc)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_active_main_menu_item
    @main_menu[:teachers][:active] = true
  end
end
