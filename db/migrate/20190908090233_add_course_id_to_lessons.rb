class AddCourseIdToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :course_id, :bigint
  end
end
