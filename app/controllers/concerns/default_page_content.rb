module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Rails Portfolio"
    @seo_keywords = "Hannah Melton, Ruby on Rails, portfolio"
  end

end
