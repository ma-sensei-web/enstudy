class Quiz < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  validates :title,  presence: true
  validates :answer, presence: true
  validates :image,  presence: true
end
