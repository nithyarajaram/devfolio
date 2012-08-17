class AdduserIdtoportfolio < ActiveRecord::Migration
  def up
    add_column :portfolios, :user_id, :integer
  end

  def down
    remove_column :portfolios, :user_id
  end
end
