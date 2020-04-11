class List < ApplicationRecord
  belongs_to :user

  has_many :cards, dependent: :destroy

  include RankedModel
  ranks :row_order, with_same: :user_id

  validates :title, length: { in: 1..255 }
end
