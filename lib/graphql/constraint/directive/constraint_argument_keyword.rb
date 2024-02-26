# frozen_string_literal: true

module GraphQL
  module Constraint
    module Directive
      module ConstraintArgumentKeyword
        def initialize(name, type, desc = nil, **kwargs)
          if kwargs.key?(:constraints)
            constraints = kwargs.delete(:constraints)
            if constraints
              directives = kwargs.delete(:directives) || {}
              constraint_directive = GraphQL::Constraint::Directive::Constraint
              directives[constraint_directive] = constraints
              kwargs[:directives] = directives
            end
          end

          super
        end
      end
    end
  end
end
