class Product < ActiveRecord::Base
   belongs_to :user
   has_many :sales, dependent: :destroy
   has_many :users, through: :sales

   validates :item_name, presence: true, length: 2..30
   validates_format_of :item_name, with: /\A[-a-z ']+\Z/i
   validates :cost, presence: true


end
