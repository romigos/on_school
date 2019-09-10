class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :name
      t.text :description
      t.integer :position
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
