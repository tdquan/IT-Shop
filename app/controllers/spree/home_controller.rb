class Spree::HomeController < ApplicationController
  def index
    @taxonomies = Spree::Taxonomy.includes(root: :children)

    if !current_spree_user.orders.incomplete.order('created_at DESC').first.nil?
      @order = current_spree_user.orders.incomplete.order('created_at DESC').first
    else
      @order = current_spree_user.orders.new
    end
  end
end
