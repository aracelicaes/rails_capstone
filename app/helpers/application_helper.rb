module ApplicationHelper
  def category_display
    Category.all.limit(4)
  end

  def categories_nav_links
    list_item = content_tag(:li) do
    end
    category_display.collect do |category|
      list_item +=
        content_tag(:a) do
          link_to category_path(category), class: 'mr-3' do
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
      content_tag(:div, class: 'session_li') do
        link_to new_article_path, class: 'd-flex flex-column align-items-center is-info mr-4' do
          content_tag(:small, class: 'pt-1') do
            'NEW ARTICLE'
          end
        end
      end +
        content_tag(:div, class: 'session_li') do
          link_to current_user, class: 'd-flex flex-column align-items-center is-info mr-4' do
            content_tag(:small, class: 'pt-1') do
              current_user.name.upcase
            end
          end
        end +
        content_tag(:div, class: 'session_li mr-2') do
          link_to destroy_user_session_path, method: :delete do
            'SIGN OUT'
          end
        end +
        content_tag(:div, class: 'session_li mr-2') do
          content_tag(:i, class: 'session_ic fa fa-search pt-1') do
          end
        end
    else
      content_tag(:div, class: 'session_li mr-2') do
        link_to new_user_session_path do
          'SIGN IN'
        end
      end +
        separator +
        content_tag(:div, class: 'session_li mr-2') do
          link_to new_user_registration_path do
            'SIGN UP'
          end
        end +
        content_tag(:div, class: 'session_li mr-2') do
          content_tag(:i, class: 'session_ic fa fa-search pt-1') do
          end
        end
    end
  end
end
