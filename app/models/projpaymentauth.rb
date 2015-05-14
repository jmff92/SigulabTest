class Projpaymentauth < ActiveRecord::Base

  belongs_to :project

  attr_localized :amount

  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }, if: "!amount.blank?"
  validates :concept, presence: true, length: {maximum: 512}
  validates :observations, length: {maximum: 1024}
  validates :registry, presence: true, length: {maximum: 512}
  validates :recipient, presence: true, length: {maximum: 512}
  validates :from, presence: true
  validates :delivered_id, presence: true

end
