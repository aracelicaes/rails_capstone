require 'rails_helper'

RSpec.describe ArticlesController, type: :routing do
  describe 'Routing' do
    it do
      should route(:get, '/').to(action: :index)
    end

    it do
      should route(:get, '/articles/new').to(action: :new)
    end

    it do
      should route(:get, '/articles/1').to('articles#show', id: '1')
    end

    it do
      should route(:get, '/articles/1/edit').to('articles#edit', id: '1')
    end

    it do
      should route(:post, '/articles').to('articles#create')
    end

    it do
      should route(:put, '/articles/1').to('articles#update', id: '1')
    end

    it do
      should route(:patch, '/articles/1').to('articles#update', id: '1')
    end

    it do
      should route(:delete, '/articles/1').to('articles#destroy', id: '1')
    end
  end
end
