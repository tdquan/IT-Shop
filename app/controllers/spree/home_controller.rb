class Spree::HomeController < Spree::StoreController
  before_action :set_user, :set_order

  def index
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end

  def show
    if params[:category] == "laptop"
      set_packages(0)
    elsif params[:category] == "desktop"
      set_packages(3)
    elsif params[:category] == "workstation"
      set_packages(6)
    end

    @basic_stock = package_has_stock(@basic)
    @standard_stock = package_has_stock(@standard)
    @premium_stock = package_has_stock(@premium)
  end

  private

  # Define the packages for each landing page choices (laptop, desktop, workstation)
  def set_packages(n)
    @basic = Spree::Taxonomy.all[n]
    @standard = Spree::Taxonomy.all[n+1]
    @premium = Spree::Taxonomy.all[n+2]
  end

  def package_has_stock(package)
    set_products(package)

    @products.each do |p|
      if p.stock_items.first.count_on_hand <= 0
        return false
      end
    end

    return true
  end

  def set_products(package)
    # Define the taxon that include all the package items
    @taxon = package.taxons.first
    return unless @taxon

    # Find all products in the package
    @searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
    @products = @searcher.retrieve_products.where("meta_keywords like?", "%#{package.name.split.map(&:downcase).join('_')}_default%")
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end

end
