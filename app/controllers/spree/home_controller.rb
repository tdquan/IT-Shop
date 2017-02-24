class Spree::HomeController < ApplicationController
  before_action :set_order

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
  end


  private

  # Define the packages for each landing page choices (laptop, desktop, workstation)
  def set_packages(n)
    @basic = Spree::Taxonomy.all[n]
    @standard = Spree::Taxonomy.all[n+1]
    @premium = Spree::Taxonomy.all[n+2]
  end


  def set_order
    if !current_spree_user.orders.incomplete.order('created_at DESC').first.nil?
      @order = current_spree_user.orders.incomplete.order('created_at DESC').first
    else
      @order = current_spree_user.orders.new
    end
  end

end
