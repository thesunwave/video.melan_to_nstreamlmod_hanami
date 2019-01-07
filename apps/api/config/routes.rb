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
