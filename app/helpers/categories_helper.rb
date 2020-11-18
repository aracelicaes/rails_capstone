module CategoriesHelper
  def category_priority
    if @last_category
      content_tag(:em, class: 'mb-2') do
        "(Insert a unique Priority number greater than #{@last_category})"
      end
    else
      content_tag(:em, class: 'mb-2') do
        '(1 Is The Highest Priority)'
      end
    end
  end
end
