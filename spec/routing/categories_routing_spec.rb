require 'rails_helper'

RSpec.describe CategoriesController, type: :routing do
  describe 'Routing' do
    it do
      should route(:get, '/categories').to('categories#index')
    end

    it do
      should route(:get, '/categories/new').to('categories#new')
    end

    it do
      should route(:get, '/categories/1').to('categories#show', id: '1')
    end

    it do
      should route(:get, '/categories/1/edit').to('categories#edit', id: '1')
    end

    it do
      should route(:post, '/categories').to('categories#create')
    end

    it do
      should route(:put, '/categories/1').to('categories#update', id: '1')
    end

    it do
      should route(:patch, '/categories/1').to('categories#update', id: '1')
    end

    it do
      should route(:delete, '/categories/1').to('categories#destroy', id: '1')
    end
  end
end
