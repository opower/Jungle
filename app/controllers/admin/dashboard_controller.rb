class Admin::DashboardController < ApplicationController
  def show
    @count = Product.count
    @ccount = Category.count
  end
end
