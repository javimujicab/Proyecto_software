class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :content, presence: { message: 'Debes escribir un comentario' }
end
