class Spree::PackagesController < ApplicationController
  def index
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end

  def show
    set_package
    @computers = (@package.taxons.find_by name: 'Computer').products
  end

  private

  def set_package
    @package = Spree::Taxonomy.find(params[:id])
  end
end
