class Product < ApplicationRecord
  #attr_accessor :name, :description, :image_url

  validates_presence_of :name
  validates_numericality_of :price

  validate :price_must_be_at_least_a_dollar

  private

  def price_must_be_at_least_a_dollar
    errors.add(:price, 'should be at least 1') if price.nil? || price < 1
  end

end
