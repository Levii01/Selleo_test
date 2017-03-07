module ApplicationHelper
  def select_class_alert(type)
    type.to_s == 'notice' ? 'success' : 'danger'
  end
end
