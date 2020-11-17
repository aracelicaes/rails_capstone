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
        link_to new_article_path, class: 'd-flex align-items-center is-info mr-3' do
          content_tag(:i, class: 'fa fa-plus pt-1 pr-1') do
          end +
            content_tag(:small, class: 'pt-1') do
              'ARTICLE'
            end
        end
      end +
        content_tag(:div, class: 'session_li pt-1') do
          link_to current_user, class: 'd-flex align-items-center is-info mr-2' do
            content_tag(:i, class: 'fa fa-user pr-1', aria: { hidden: true }) do
            end +
              content_tag(:small) do
                current_user.username.upcase
              end
          end
        end +
        content_tag(:div, class: 'session_li mr-2 s_padding') do
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
