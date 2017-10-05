class Product < ApplicationRecord
  #attr_accessor :name, :description, :image_url

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :price

  has_attached_file :image, styles: { xs: '150x150#', sm: 'x300', md: 'x500', lg: 'x800' }
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validate :price_must_be_at_least_a_dollar

  def thumbnail_url
    image.url(:xs)
  end

  def image_url
    image.url(:sm)
  end

  private

  def price_must_be_at_least_a_dollar
    errors.add(:price, 'should be at least 1') if price.nil? || price < 1
  end

  def self.find_products
    all.order(:id)
  end

end
