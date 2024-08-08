module ApplicationHelper
  def empty_cart_check?
    enhanced_cart.any?
  end
  
end
