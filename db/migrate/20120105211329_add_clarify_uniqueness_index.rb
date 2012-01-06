class AddClarifyUniquenessIndex < ActiveRecord::Migration
  def up
    add_index :evaluations, :clarify, :unique => true
  end

  def down
    remove_index :evaluations, :clarify
  end
end
