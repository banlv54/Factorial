class CreateFactorialls < ActiveRecord::Migration
  def change
    create_table :factorialls do |t|
      t.string :n
      t.string :result

      t.timestamps null: false
    end
  end
end
