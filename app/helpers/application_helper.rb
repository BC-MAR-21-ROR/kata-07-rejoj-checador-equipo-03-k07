module ApplicationHelper
  def flash_bootstrap(type)
    {
      'error' => :danger,
      'notice' => :primary,
      'alert' => :warning,
      'sucess' => :sucess
    }.fetch(type, 'notice')
  end
end
