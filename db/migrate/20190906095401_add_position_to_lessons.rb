class AddPositionToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :position, :integer
  end
end
