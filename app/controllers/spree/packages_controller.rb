class Spree::PackagesController < Spree::StoreController
  before_action :set_user, :set_package, :set_order

  def show
  end

  # Quick add
  def add
    set_products
    # Add products into the cart as line items
    if package_has_stock?
      @products.each do |p|
        variant = Spree::Variant.where(product_id: p.id).first
        item = @order.line_items.new(variant_id: variant.id)
        item.quantity = params[:package][:quantity]
        @order.contents.update_cart({}) # optional: set parameter here to be order_params and un-comment the order_params
        item.save
      end
    else
      flash[:error] = "Not enough stock"
    end
    redirect_to :back
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

    if package_has_stock?
      @products.each do |p|
        variant = Spree::Variant.where(product_id: p.id).first
        item = @order.line_items.new(variant_id: variant.id)
        item.quantity = params[:package][:quantity]
        @order.contents.update_cart({}) # optional: set parameter here to be order_params and un-comment the order_params
        item.save
      end
    else
      flash[:error] = "Not enough stock"
    end
    redirect_to :back
  end

  def package_has_stock?
    set_products

    @products.each do |p|
      if p.stock_items.first.count_on_hand <= 0
        return false
      end
    end

    return true
  end

  private

  def set_package
    @package = Spree::Taxonomy.find_by(name: params[:package_name].split.map(&:capitalize).join(' '))
  end

  def set_products
    # Define the taxon that include all the package items
    @taxon = @package.taxons.first
    return unless @taxon

    # Find all products in the package
    @searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
    @products = @searcher.retrieve_products.where("meta_keywords like?", "%#{@package.name.split.map(&:downcase).join('_')}_default%")
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end

  # def order_params
  #   if params[:order]
  #     params[:order].permit(*permitted_order_attributes)
  #   else
  #     {}
  #   end
  # end
end
