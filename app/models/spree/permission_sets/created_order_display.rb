module Spree
  module PermissionSets
    class CreatedOrderDisplay < PermissionSets::Base
      def activate!
        can [:display, :admin, :edit, :cart], Order, ["created_by_id = ?", user.id] do |order|
          order.created_by_id == user.id
        end
        can [:display, :admin], Spree::Payment
        can [:display, :admin], Spree::Shipment
        can [:display, :admin], Spree::Adjustment
        can [:display, :admin], Spree::LineItem
        can [:display, :admin], Spree::ReturnAuthorization
        can [:display, :admin], Spree::CustomerReturn
        can [:display, :admin], Spree::OrderCancellations
        can [:display, :admin], Spree::Reimbursement
        can [:display, :admin], Spree::ReturnItem
        can [:display, :admin], Spree::Refund
      end
    end
  end
end