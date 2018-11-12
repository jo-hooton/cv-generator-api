class List < ApplicationRecord
    belongs_to: :cv
    has_many: :list_items
end
