module Api
  module Controllers
    module Films
      class Show
        include Api::Action

        accept :json

        expose :list

        def call(params)
          @list = Api::Presenters::Main.new(VideoMelan::Services::Fetcher.new(kind: :get_film, movie_id: params[:id]).call)
        end
      end
    end
  end
end
