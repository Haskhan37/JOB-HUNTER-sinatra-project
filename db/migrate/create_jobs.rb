class CreateJobs < ActiveRecord::Migration
    def change
      create_table :jobs do |t|
        t.string :company_name
        t.text :description
        t.string :title
        t.text :salary
        t.string :location
        t.timestamps null: false
      end
    end
  end
  