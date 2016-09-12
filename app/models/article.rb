class Article < ApplicationRecord
  validates :title,:description, :email, :category_id, {presence: true}
  before_save :generate_url
  belongs_to :category

  def generate_url
      randomstuff = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890".split('').sample(8).join('')
      self.url = randomstuff
  end

end
