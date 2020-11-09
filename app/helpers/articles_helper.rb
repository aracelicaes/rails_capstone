module ArticlesHelper

  def edit_by_author(article)
    content_tag(:div, class: 'edit_show') do
      content_tag(:i, class: 'fa fa-pencil', aria: { hidden: true } ) do
        link_to edit_article_path(@article) if current_user.id == @article.author.id do
          'Edit My Article'
        end
      end
    end
  end

end
