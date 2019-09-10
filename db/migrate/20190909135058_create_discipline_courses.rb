class CreateDisciplineCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :discipline_courses do |t|
      t.references :discipline, foreigh_key: true
      t.references :course, foreigh_key: true
      t.timestamps
    end
  end
end
