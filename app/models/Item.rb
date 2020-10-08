class Item < ActiveRecord::Base
    belongs_to :user

    validates :name, :quantity, presence: true
end 