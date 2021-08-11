# frozen_string_literal: true

class ParentsController < ApplicationController
  before_action :authenticate_parent!

  private

  def parent_params
    params.require(:parent).permit(:name, :email, :child)
  end
end
