class RemoveBudgetFromPortfolio < ActiveRecord::Migration
  def up
    remove_column :portfolios, :budget
  end

  def down
    add_column :portfolios, :budget, :integer
  end
end
