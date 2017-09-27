class Product < ApplicationRecord
  #attr_accessor :name, :description, :image_url

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :price

  /validates_format_of :image_url,
                      with: %r{\A(git|jpg|jpeg|png)\z}i,
                      message: 'must be a URL for GIF, JPG, JPEG or PNG image'
                      /
  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validate :price_must_be_at_least_a_dollar

  private

  def price_must_be_at_least_a_dollar
    errors.add(:price, 'should be at least 1') if price.nil? || price < 1
  end

end
