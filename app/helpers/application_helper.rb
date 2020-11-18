module ApplicationHelper
  def category_display
    Category.all.limit(4)
  end

  def categories_nav_links
    list_item = content_tag(:div, class: 'links') do
    end

    category_display.collect do |category|
      list_item +=
        content_tag(:div) do
          link_to category_path(category), class: 'link' do
            category.name.upcase
          end
        end
    end
    list_item
  end

  def session_links
    separator = content_tag(:div, class: 'session_li mr-2') do
      '|'
    end

    if user_signed_in?
      content_tag(:div) do
        link_to new_article_path, class: 'newArticle link link_icon' do
          content_tag(:i, class: 'icon fa fa-plus') do
          end +
            content_tag(:small) do
              'ARTICLE'
            end
        end
      end +
        content_tag(:div) do
          link_to current_user, class: 'username link link_icon' do
            content_tag(:i, class: 'icon fa fa-user', aria: { hidden: true }) do
            end +
              content_tag(:small) do
                current_user.username.upcase
              end
          end
        end +
        content_tag(:div) do
          link_to destroy_user_session_path, class: 'signOut link', method: :delete do
            content_tag(:small) do
              'SIGN OUT'
            end
          end
        end +
        content_tag(:i, class: 'search fa fa-search') do
        end
    else
      content_tag(:div) do
        link_to new_user_session_path, class: 'link' do
          'SIGN IN'
        end
      end +
        separator +
        content_tag(:div) do
          link_to new_user_registration_path, class: 'link' do
            'SIGN UP'
          end
        end +
        content_tag(:i, class: 'session_ic fa fa-search pt-1') do
        end
    end
  end
end
