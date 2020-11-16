module ArticlesHelper
  def article_update(article)
    return unless current_user.id == article.author.id

    content_tag(:div) do
      link_to edit_article_path(article) do
        content_tag(:div, class: 'd-flex') do
          content_tag(:i, class: 'fa fa-pencil mr-2', aria: { hidden: true }) do
          end +
            content_tag(:p) do
              'Edit My Article'
            end
        end
      end
    end +
      content_tag(:div) do
        link_to article_path(article), method: :delete do
          content_tag(:div, class: 'd-flex') do
            content_tag(:i, class: 'fa fa-trash mr-2', aria: { hidden: true }) do
            end +
              content_tag(:p) do
                'Delete My Article'
              end
          end
        end
      end
  end
end
