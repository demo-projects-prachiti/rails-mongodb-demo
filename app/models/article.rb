class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Mongoid::Attributes::Dynamic
  
  field :name, type: String
  field :content, type: String
  has_mongoid_attached_file :file

  validates_attachment :file, content_type: { content_type: /\Aimage\/.*\Z/ }

  has_many :comments, dependent: :destroy
end