class Book < ActiveRecord::Base
  belongs_to :user
  #userの中に所属しています
  has_many :bookmarks
  #bookの中にbookmarksが所属しています
  has_many :reviews
  mount_uploader :image, BookImageUploader
  belongs_to :category

  validates :title, presence: true
  validates :user_id, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :price, presence: true, numericality: true
  validates :publish_date, presence: true
  validates :category_id, presence: true
  
  scope :categorize, -> cid {
    where(category_id: cid)
  }
  
end