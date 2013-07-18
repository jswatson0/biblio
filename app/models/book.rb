class Book < ActiveRecord::Base
  mount_uploader :cover, PictureUploader
  attr_accessible :author, :catagory, :cover, :description, :isbn, :published, :rating, :title
  belongs_to :user
end
