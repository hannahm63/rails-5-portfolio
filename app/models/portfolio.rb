class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  validates_presence_of :title, :body
  mount_uploader :thumbnail_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  # This is good because it keeps all of the database logic in the model rather than making these calls in the controller
  def self.vue
    where(subtitle: 'Vue')
  end

  def self.by_position
    order("position ASC")
  end

  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }
end
