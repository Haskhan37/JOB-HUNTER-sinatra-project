class CreateJobs < ActiveRecord::Migration
  def change
    create_table "jobs" do |t|
      t.text "company_name"
      t.text "description"
      t.text "title"
      t.text "salary"
      t.text "location"
      t.text "timestamps"
      
    end
  end
end
