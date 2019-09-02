class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.bigint :teacher_id
      t.bigint :discipline_id
      t.timestamps
    end
  end
end
