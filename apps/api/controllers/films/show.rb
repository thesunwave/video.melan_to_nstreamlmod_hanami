module Api
  module Controllers
    module Films
      class Show
        include Api::Action

        accept :json

        expose :list

        def call(params)
          @list = Cachy.cache(params[:id], expires_in: 86400) do
            Api::Presenters::Main.new(VideoMelan::Services::Fetcher.new(kind: :get_film, movie_id: params[:id]).call)
          end
        end
      end
    end
  end
end
