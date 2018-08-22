module Spree
  module PermissionSets
    class CreatedUserManagement < PermissionSets::Base
      def activate!
        can [:admin, :display, :create, :save_in_address_book, :remove_from_address_book, :addresses, :orders, :items], Spree::User

        # Note: This does not work with accessible_by.
        # See https://github.com/solidusio/solidus/pull/1263
        can :update_email, Spree.user_class do |user|
          user.spree_roles.none?
        end

        cannot [:delete, :destroy], Spree.user_class
        can :display, Spree::Role
      end
    end
  end
end