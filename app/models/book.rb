class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre

  validates :title, presence: true, uniqueness: { scope: :author_id }
end
