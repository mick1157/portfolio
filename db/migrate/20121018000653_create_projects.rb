class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :url
      t.string :picture
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
