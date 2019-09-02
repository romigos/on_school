# frozen_string_literal: true

class Admin::MainController < Admin::BaseController
  skip_before_action :set_active_main_menu_item

  def index
    redirect_to admin_teachers_path
  end
end
