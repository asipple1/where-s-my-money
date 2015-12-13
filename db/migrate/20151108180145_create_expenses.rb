class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
    	t.integer :group_id
    	t.integer :user_id
    	t.text :description
    	t.money :cost
    	t.date :date
    	t.boolean :paid
      t.timestamps null: false
    end
  end
end
