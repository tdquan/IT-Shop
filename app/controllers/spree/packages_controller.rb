class Spree::PackagesController < Spree::StoreController
  before_action :set_package, :set_order

  def show
  end

  # Quick add

  def add

    # Define the taxon that include all the package items
    @taxon = @package.taxons.first
    return unless @taxon

    # Find all products in the package
    @searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
    @products = @searcher.retrieve_products.where("meta_keywords like?", "%#{@package.name.downcase}_default%")
    @taxonomies = Spree::Taxonomy.includes(root: :children)

    # Add products into the cart as line items
    @products.each do |p|
      variant = Spree::Variant.where(product_id: p.id).first
      item = @order.line_items.new(variant_id: variant.id)
      item.quantity = params[:package][:quantity]
      @order.contents.update_cart({}) # optional: set parameter here to be order_params and un-comment the order_params
      item.save
    end

    redirect_to root_path
  end

  # Add customized package

  def add_customized

    # Define the taxon that include all the package items
    @taxon = @package.taxons.first
    return unless @taxon

    # Find all products in the package
    @searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
    @products = []
    params[:package].reject {|e| e == "quantity"}.each do |k, v|
      @products << @searcher.retrieve_products.find(v.to_i)
    end
    @taxonomies = Spree::Taxonomy.includes(root: :children)

    @products.each do |p|
      variant = Spree::Variant.where(product_id: p.id).first
      item = @order.line_items.new(variant_id: variant.id)
      item.quantity = params[:package][:quantity]
      @order.contents.update_cart({}) # optional: set parameter here to be order_params and un-comment the order_params
      item.save
    end

    redirect_to :back
  end

  private

  def set_package
    @package = Spree::Taxonomy.find_by(name: params[:package_name].capitalize)
  end

  def set_order
    if !current_spree_user.orders.incomplete.order('created_at DESC').first.nil?
      @order = current_spree_user.orders.incomplete.order('created_at DESC').first
    else
      @order = current_spree_user.orders.new
    end
  end

  # def order_params
  #   if params[:order]
  #     params[:order].permit(*permitted_order_attributes)
  #   else
  #     {}
  #   end
  # end
end
