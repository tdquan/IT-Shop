class Spree::PackagesController < ApplicationController
  def show
    set_package
  end

  private

  def set_package
    @package = Spree::Taxonomy.find(params[:id])
  end
end
