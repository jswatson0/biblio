class Book < ActiveRecord::Base

  mount_uploader :cover, PictureUploader
  
  attr_accessible :author, :catagory, :cover, :description, :isbn, :published, :rating, :title
  
  belongs_to :user

  if not :isbn.blank?
  	before_create do 
  		client = Goodreads::Client.new(:api_key => 'fJ9s57rL9axejFqpiW3g', :api_secret => 'evEy1rsq9nxBRlnpXUzkskEhqNx6RhB1Lrmcpj0fBJE')
  		book = client.book_by_isbn(self.ISBN)
  		self.title = book.title if self.title.blank?
      if self.author.blank?
        if book.authors.author.is_a?(Array)
          self.author = book.authors.author[0].name
        else 
          self.author = book.authors.author.name
        end
      end
      self.description = Sanitize.clean(book.description) if self.description.blank?
      self.goodreadscover = book.image_url
    end
  end
end
