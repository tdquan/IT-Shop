class Spree::PackagesController < ApplicationController
  def show
    set_package
    if current_spree_user.orders.last.state == "cart"
      @order = current_spree_user.orders.last
    else
      @order = current_spree_user.orders.new
    end
  end

  private

  def set_package
    @package = Spree::Taxonomy.find(params[:id])
  end
end
