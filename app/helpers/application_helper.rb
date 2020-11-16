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

  def lorem_filler
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam hendrerit nibh id lacus vestibulum euismod.
    Donec commodo neque sed finibus vestibulum. Nullam mattis sed dui vel blandit. Duis eget tellus arcu.
    Phasellus interdum velit volutpat sagittis iaculis.
    Curabitur bibendum, turpis vel elementum semper, elit ipsum accumsan lacus, lacinia rhoncus elit nibh in diam.
    Aliquam quis lacus nec quam efficitur luctus quis condimentum eros. Nam faucibus, erat vel egestas dictum, lorem
    risus vehicula nibh, vel convallis est turpis gravida turpis. Proin tortor arcu, tempus sit amet nisi ac,
    vestibulum molestie mauris. Etiam efficitur ultrices elit a gravida.\r\n\r\nNam vitae enim id nisi porta posuere a
    a odio.
    Vestibulum id dapibus dolor, a hendrerit leo. Aliquam erat volutpat.
    Ut feugiat, lectus eu posuere sodales, tellus turpis ullamcorper felis, a consequat leo lorem eu nulla.
    Curabitur vitae ante iaculis, maximus eros eu, dapibus nisl. Nullam auctor augue sem, sed feugiat eros tincidunt ac.
    Praesent mollis, urna id feugiat egestas, purus nisl dignissim nisi, quis tincidunt lacus augue quis sapien.
    Sed venenatis eu orci in sollicitudin. Ut egestas pharetra orci, in cursus ex facilisis eu.
    Sed maximus, sem sed tristique commodo, est urna iaculis ante, id dignissim odio nibh quis ligula.\r\n\r\nInteger
    mattis, velit nec imperdiet vestibulum, massa leo finibus nisl, sit amet vehicula nunc turpis quis est. Mauris
    orci urna, tristique et finibus ac, ornare quis dolor. Suspendisse potenti. Vivamus non consequat mi.
    Ut id orci mattis sapien pharetra suscipit.
    Vestibulum sagittis felis et turpis congue, eu mattis eros luctus. Cras a auctor neque, sit amet porttitor mi.
    Pellentesque tristique dapibus velit at consectetur. Vivamus mollis cursus egestas.
    Sed lectus neque, congue vitae massa eget, placerat pharetra eros. Vestibulum eu tincidunt nisi.
    Sed mattis aliquet suscipit.\r\n\r\nCurabitur semper aliquet eros in molestie. Maecenas eu tortor ut elit ultrices
    porttitor. Vivamus blandit elementum iaculis. Phasellus efficitur vulputate augue vitae porta. Sed lacinia enim vel
    auctor semper. Fusce mauris nisl, euismod vestibulum lectus ac, condimentum placerat mi. Vivamus imperdiet massa
    tristique dapibus pharetra. Sed velit leo, hendrerit a felis nec, faucibus vestibulum ligula. Duis in dapibus
    nisl.\r\n\r\nCras tincidunt ullamcorper diam sed efficitur. Donec eget finibus dolor, sed auctor ligula.
    Integer sit amet tristique felis.
    Maecenas bibendum vestibulum metus. Donec semper lorem non feugiat ornare. Donec dignissim ante at risus ultricies,
    vel laoreet est maximus. In bibendum turpis a lorem elementum tempor. Praesent semper maximus mauris vel
    consectetur. Quisque accumsan, diam non mollis fringilla, ante velit elementum sapien, vel dapibus urna felis
    quis mi. Maecenas tincidunt justo eget lectus accumsan dignissim. In lobortis vestibulum dui at faucibus. Integer
    laoreet purus quis massa luctus, ac interdum sapien congue. Nulla laoreet placerat ultricies. Fusce ornare
    lobortis nisi, nec pulvinar est. Pellentesque interdum, quam vel auctor malesuada, augue nisl
    finibus nisl, vitae facilisis ex tellus eu nibh. Nullam nec ullamcorper massa.'
  end
end
