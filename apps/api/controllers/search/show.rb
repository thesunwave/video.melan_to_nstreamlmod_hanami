module Api
  module Controllers
    module Search
      class Show
        include Api::Action

        accept :json

        expose :list

        def call(params)
          @list = Api::Presenters::Main.new(
            playlist_name: 'Результаты поиска',
            channels: VideoMelan::Services::Search.new(params[:search]).call
          )
        end
      end
    end
  end
end
