class Post < ApplicationRecord
  has_many :solicits, dependent: :destroy
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :titulo, presence: { message: 'El título es obligatorio' }
  validates :sigla_ramo, presence: { message: 'La sigla del ramo es obligatoria' }
  validates :precio, presence: { message: 'El precio es obligatorio' }
  validates_numericality_of :precio, message: "Debe ser un número"
  validates :descripcion, presence: { message: 'La descripción es obligatoria' }

end
