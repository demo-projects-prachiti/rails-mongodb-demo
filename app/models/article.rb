class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :content, type: String

  has_many :comments, dependent: :destroy
end