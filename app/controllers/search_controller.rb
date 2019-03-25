class SearchController < ApplicationController
  def results
    @query = params[:q]
    @category = params[:category_id]

    if @category.empty?
      @products = Product.where('name LIKE ? or description LIKE ?', "%#{@query}%", "%#{@query}%")
    else
      @products = Product.where('(name LIKE ? or description LIKE ?) AND category_id = ?', "%#{@query}%", "%#{@query}%", "#{@category}")
    end
  end
end
