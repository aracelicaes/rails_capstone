module ArticlesHelper
  def article_update(article)
    return unless current_user.id == article.author.id

    link_to edit_article_path(article) do
      content_tag(:div, class: 'd-flex') do
        content_tag(:i, class: 'fa fa-pencil mr-2', aria: { hidden: true }) do
        end +
        content_tag(:p) do
          'Edit My Article'
        end
      end
    end
  end
end
