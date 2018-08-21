module Spree
  module PermissionSets
    class CreatedOrderManagement < PermissionSets::Base
      def activate!
        can :display, Spree::ReimbursementType
        can :manage, Order, ["created_by_id = ?", user.id] do |order|
          order.created_by_id == user.id
        end
        can :manage, Spree::Payment
        can :manage, Spree::Shipment
        can :manage, Spree::Adjustment
        can :manage, Spree::LineItem
        can :manage, Spree::ReturnAuthorization
        can :manage, Spree::CustomerReturn
        can :manage, Spree::OrderCancellations
        can :manage, Spree::Reimbursement
        can :manage, Spree::ReturnItem
        can :manage, Spree::Refund
      end
    end
  end
end