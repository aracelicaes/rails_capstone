require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'Routing' do
    it do
      should route(:get, '/users').to(action: :index)
    end

    it do
      should route(:get, '/users/new').to(action: :new)
    end

    it do
      should route(:get, '/users/1').to('users#show', id: '1')
    end

    it do
      should route(:get, '/users/1/edit').to('users#edit', id: '1')
    end

    it do
      should route(:post, '/users').to('users#create')
    end

    it do
      should route(:put, '/users/1').to('users#update', id: '1')
    end

    it do
      should route(:patch, '/users/1').to('users#update', id: '1')
    end

    it do
      should route(:delete, '/users/1').to('users#destroy', id: '1')
    end
  end
end
