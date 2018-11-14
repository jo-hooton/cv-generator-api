class Cv < ApplicationRecord
    belongs_to :user
    has_many :text_items
    has_many :lists
    has_many :skills
    has_many :contact_details
end
