class List < ApplicationRecord
creating_new_CV
    belongs_to :cv
    has_many :list_items

end
