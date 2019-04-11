# frozen_string_literal: true

class SearchController < ApplicationController
  def results
    @query = params[:search]
    @category = params[:category_id]

    @products = if @category.empty?
                  Product.where('name LIKE ? or description LIKE ?', "%#{@query}%", "%#{@query}%")
                else
                  Product.where('(name LIKE ? or description LIKE ?) AND category_id = ?', "%#{@query}%", "%#{@query}%", @category.to_s)
                end
  end
end
