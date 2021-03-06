# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
root to: 'start#show'

resource :main,    only: [:show]
resource :start,   only: [:show]
resource :new,     only: [:show]
resource :search,  only: [:show]
resources :films,  only: [:show] do
  collection do
    get 'from_rss'
  end
end
get '/search/:id', to: 'search#show', as: :search
