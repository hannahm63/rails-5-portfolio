class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  include Placeholder

  validates_presence_of :title, :body, :main_image, :thumbnail_image 

  # THis is good because it keeps all of the database logic in the model rather than making these calls in the controller
  def self.vue
    where(subtitle: 'Vue')
  end

  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||=  Placeholder.image_generator(height: '600', width: '400') 
    self.thumbnail_image ||=  Placeholder.image_generator(height: '350', width: '200') 
 end

end
