class Job < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :company_name, :description, :title, :location, :salary
end
