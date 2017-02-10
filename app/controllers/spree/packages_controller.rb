class Spree::PackagesController < ApplicationController
  def index
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end

  def show
    set_package
  end

  private

  def set_package
    @package = Spree::Taxonomy.find(params[:id])
  end
end
