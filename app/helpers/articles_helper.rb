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

  def popular_article
    return if @most_voted_article.nil?

    content_tag(:div, class: 'popular') do
      link_to article_path(@most_voted_article), class: 'popular_a' do
        image_tag url_for(@most_voted_article.image), class: 'content_img' if @most_voted_article.image.attached?
      end
    end +
      content_tag(:div, class: 'popular content') do
        link_to article_path(@most_voted_article), class: 'popular_title' do
          content_tag(:p, class: 'title pop_title') do
            @most_voted_article.title
          end +
            content_tag(:p, class: 'text') do
              truncate(@most_voted_article.text, length: 200, omission: '...')
            end
        end
      end
  end

  def last_article
    return if @last_written_article.nil?

    content_tag(:div, class: 'last') do
      link_to article_path(@last_written_article), class: 'last_a' do
        image_tag url_for(@last_written_article.image), class: 'content_img' if @last_written_article.image.attached?
      end
    end +
      content_tag(:div, class: 'last content') do
        link_to article_path(@last_written_article), class: 'last_title' do
          content_tag(:p, class: 'last_title_text') do
            @last_written_article.title
          end
        end
      end
  end
end
