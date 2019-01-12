module Api
  module Controllers
    module Films
      class FromRss
        include Api::Action

        accept :json

        expose :list

        def call(params)
          @list = Api::Presenters::Main.new(
            playlist_name: 'Недавно добавленные',
            channels: VideoMelan::Services::Fetcher.new(kind: :from_rss).call
          )
        end
      end
    end
  end
end
