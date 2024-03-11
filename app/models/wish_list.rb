class WishList < ApplicationRecord
  belongs_to :user
  has_many :wishes

  # 値が空でない（nil や空文字でない）ようにバリデーションを設定
  # 最大255文字かつ未記入であることを許容しないバリデーションを設定
  validates :title, presence: true, length: { maximum: 255 }

end
