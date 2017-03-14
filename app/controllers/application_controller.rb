class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_user
    if current_spree_user.nil?
      @user = Spree::User.new
    else
      @user = current_spree_user
    end
  end

  def set_order
    if !@user.orders.incomplete.order('created_at DESC').first.nil?
      @order = @user.orders.incomplete.order('created_at DESC').first
    else
      @order = @user.orders.new
    end
  end

end
