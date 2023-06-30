class Solicit < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :fecha, presence: { message: 'La fecha es obligatoria' }
  validates :mensaje, presence: { message: 'Mensaje es obligatorio' }
  def start_time
    self.fecha
  end 
end
