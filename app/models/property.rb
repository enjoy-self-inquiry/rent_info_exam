class Property < ApplicationRecord
   has_many :stations, dependent: :destroy, inverse_of: :property
   accepts_nested_attributes_for :stations, allow_destroy: true, reject_if: :all_blank
   validates :name, presence: true, length: {maximum: 30 }
   validates :price, presence: true, length: { maximum: 6 }
   validates :address, presence: true, length: { maximum: 50 }, uniqueness: true
   validates :age, presence: true, length: { maximum: 3 }
   validates :remarks, length: { maximum: 100 }
end
