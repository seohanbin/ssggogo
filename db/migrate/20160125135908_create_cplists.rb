class CreateCplists < ActiveRecord::Migration
  def change
    create_table :cplists do |t|
      t.string :cpname
      t.string :cpdate
      t.string :cpcondition
      t.string :cpamount
      t.string :cplink

      t.timestamps null: false
    end
  end
end
