class Skill < ApplicationRecord
    
    validates_presence_of :title, :percent_utilized

    def self.order_percent
        order(percent_utilized: :desc)
    end
end
