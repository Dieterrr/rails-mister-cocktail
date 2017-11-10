class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, uniqueness: true, presence: true

  mount_uploader :photo, PhotoUploader
end


# rails generate controller cocktails index new edit show
# rails generate controller doses index new edit show
