class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Mongoid::Attributes::Dynamic

  field :name, type: String
  field :content, type: String
  field :free,type: Mongoid::Boolean, default: 'true'

  # index name: 'text'

  has_mongoid_attached_file :file

  validates_attachment :file, content_type: { content_type: /\Aimage\/.*\Z/ }

  has_many :comments, dependent: :destroy
  embeds_one :category
  accepts_nested_attributes_for :category

  def self.search(search)
    if search.present?
     Article.where('$text' => {'$search' => search }).to_a
    else 
      Article.all
    end
  end

end