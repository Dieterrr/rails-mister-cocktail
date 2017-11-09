class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, uniqueness: true, presence: true
end

# You can't delete an ingredient if it used by at least one cocktail.
# When you delete a cocktail, you should delete associated doses
# (but not the ingredients as they can be linked to other cocktails).
