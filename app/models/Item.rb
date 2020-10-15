class Item < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true, uniqueness: true
    validates :quantity, presence: true
end 