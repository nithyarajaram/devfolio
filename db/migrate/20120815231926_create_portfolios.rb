class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :name
      t.string :location
      t.float :budget
      t.text :description
      t.string :githuburl

      t.timestamps
    end
  end
end
