class Spree::HomeController < ApplicationController
  def index
    @taxonomies = Spree::Taxonomy.includes(root: :children)

    if !current_spree_user.orders.where(state: "cart").last.nil?
      @order = current_spree_user.orders.where(state: "cart").last
    else
      @order = current_spree_user.orders.new
    end
  end
end
