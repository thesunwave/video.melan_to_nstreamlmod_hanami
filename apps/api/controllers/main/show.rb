module Api
  module Controllers
    module Main
      class Show
        include Api::Action

        accept :json

        expose :list

        def call(params)
          @list = Api::Presenters::Main.new(channels: VideoMelan::Services::Fetcher.new(kind: :main).call)
        end
      end
    end
  end
end
