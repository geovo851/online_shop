module CurrentCart
  extend ActiveSupport::Concern

  private

    def set_cart
      @cart = Order.find_by(user_id: current_user.id, order: false)
      unless @cart
        @cart = current_user.orders.create(order: false)
      end
    end
end