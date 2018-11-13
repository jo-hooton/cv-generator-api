class Cv < ApplicationRecord

    belongs_to :user
    has_many :list_items
    has_many :skills
    has_many :text_items
    has_many :contact_details


end
