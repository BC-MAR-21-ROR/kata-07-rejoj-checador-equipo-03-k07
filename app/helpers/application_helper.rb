module ApplicationHelper

  include Pagy::Frontend

  def flash_bootstrap(type)
    {
      'error' => :danger,
      'notice' => :primary,
      'alert' => :warning,
      'success' => :success
    }.fetch(type, 'notice')
  end
end
