class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :giver_id, null: false
      t.integer :receiver_id, null: false
    	t.text :description
    	t.money :cost
    	t.date :date
      t.string :status, null: false
      t.timestamps null: false
    end
  end
end
