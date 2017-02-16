class Spree::HomeController < ApplicationController
  def index
    @taxonomies = Spree::Taxonomy.includes(root: :children)
    @features_1 = Spree::Taxonomy.all[0].taxons[0].products
    @features_2 = Spree::Taxonomy.all[1].taxons[0].products
    @features_3 = Spree::Taxonomy.all[2].taxons[0].products
    if current_spree_user.orders.last.state == "cart"
      @order = current_spree_user.orders.last
    else
      @order = current_spree_user.orders.new
    end
  end
end
