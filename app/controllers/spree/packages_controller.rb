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
    redirect_to root_path
    @taxon = @package.taxons.first
    return unless @taxon

    @searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
    @products = @searcher.retrieve_products
    @taxonomies = Spree::Taxonomy.includes(root: :children)
    raise
  end

  private

  def set_package
    @package = Spree::Taxonomy.find(params[:id])
  end
end
