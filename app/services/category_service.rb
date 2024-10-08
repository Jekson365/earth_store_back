# app/services/category_service.rb
class CategoryService
  def initialize(category_params = nil, category = nil)
    @category_params = category_params
    @category = category
  end

  def index
    Category.all
  end

  def show
    @category
  end

  def create
    category = Category.new(@category_params)
    if category.save
      category
    else
      category.errorps
    end
  end

  def update
    if @category.update(@category_params)
      @category
    else
      @category.errors
    end
  end

  def destroy
    Product.where(category_id: @category['id']).update_all(category_id: 6)
    if @category.destroy
      @category
    end
  end
end
