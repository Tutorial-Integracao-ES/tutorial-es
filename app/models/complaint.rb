class Complaint < ApplicationRecord
  @allowed_companies = [
    'Empresa1',
    'Empresa2',
    'Empresa3',
  ]

  belongs_to :user
  validates :title, presence: true, length: {minimum: 5}
  validates :content, presence: true, length: {minimum: 10}
  validates :category, presence: true, length: {minimum: 2}
  validates :company, presence: true, inclusion: @allowed_companies
end
