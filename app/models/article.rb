class Article < ApplicationRecord
  validates :title,:description, :email, :category_id, {presence: true}
  before_save :generate_url
  belongs_to :category

  validates :email, format: { with: /\A\w+@\w+.\w+/, message: "must 1) start with a string, 2) then an '@', 3) then a string, 4) then a '.', and 5) end with a string." }
  validates :price, numericality: true

  def generate_url
      randomstuff = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890".split('').sample(8).join('')
      self.url = randomstuff
  end

end
