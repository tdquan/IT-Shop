module Spree
    class UsersController < Spree::StoreController
      before_action :set_order

      def show
      end


      private

      def set_order
        if !current_spree_user.orders.incomplete.order('created_at DESC').first.nil?
          @order = current_spree_user.orders.incomplete.order('created_at DESC').first
        else
          @order = current_spree_user.orders.new
        end
      end
    end
end
