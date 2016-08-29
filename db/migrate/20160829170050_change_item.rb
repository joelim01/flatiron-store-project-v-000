class ChangeItem < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.change :price, :decimal, :precision => 8, :scale => 2
    end
  end
end
