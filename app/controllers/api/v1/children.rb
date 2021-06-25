# frozen_string_literal: true

module API
  module V1
    class Children < Grape::API
      include API::V1::Defaults
      resource :children do
        desc 'Return all children'
        get '' do
          Child.all
        end
        desc 'Return a child'
        params do
          requires :id, type: Numeric, desc: 'ID of the child'
        end
        get ':id' do
          Child.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end
