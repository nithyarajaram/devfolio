class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :icon

      t.timestamps
    end
  end
end
