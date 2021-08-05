# frozen_string_literal: true

class ParentsController < ApplicationController
  before_action :authenticate_parent!
end
