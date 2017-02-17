class Spree::PackagesController < Spree::StoreController
  before_action :set_package

  def show
    if current_spree_user.orders.last.state == "cart"
      @order = current_spree_user.orders.last
    else
      @order = current_spree_user.orders.new
    end
  end

  def add
    # Define the taxon that include all the package items
    @taxon = @package.taxons.first
    return unless @taxon

    # Find all products in the package
    @searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
    @products = @searcher.retrieve_products
    @taxonomies = Spree::Taxonomy.includes(root: :children)

    # Add products into the cart as line items
    @products.each do |p|
      order = current_spree_user.orders.where(state: "cart").last
      variant = Spree::Variant.where(product_id: p.id).first
      item = order.line_items.new(variant_id: variant.id)
      item.quantity = params[:package][:quantity]
      order.contents.update_cart({}) # optional: set parameter here to be order_params and un-comment the order_params section
      item.save
    end

    redirect_to root_path
  end

  private

  def set_package
    @package = Spree::Taxonomy.find(params[:id])
  end

  # def order_params
  #   if params[:order]
  #     params[:order].permit(*permitted_order_attributes)
  #   else
  #     {}
  #   end
  # end
end
