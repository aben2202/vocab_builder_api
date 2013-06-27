class CreateWord < ActiveRecord::Migration
  def change
    create_table(:words) do |t|
      t.string :the_word,              		:null => false
      t.datetime :review_cycle_start,		:null => false
      t.datetime :previous_review		
      t.boolean :finished,					:null => false, :default => false
      t.timestamps
    end
  end
end
