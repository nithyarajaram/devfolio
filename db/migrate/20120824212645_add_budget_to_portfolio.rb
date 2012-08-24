class AddBudgetToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :budget, :string
  end
end
