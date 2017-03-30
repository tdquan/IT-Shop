class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_user
    if current_spree_user.nil?
      @user = Spree::User.create(first_name: "Guest")
    else
      @user = current_spree_user
    end
  end

  def set_order
    if !@user.orders.incomplete.order('created_at DESC').first.nil?
      @order = @user.orders.incomplete.order('created_at DESC').first
    elsif !spree_user_signed_in?
      @order = Spree::Order.incomplete
                           .includes(line_items: [variant: [:images, :option_values, :product]])
                           .find_or_initialize_by(guest_token: cookies.signed[:guest_token])
    else
      @order = @user.orders.new
    end
  end

end
