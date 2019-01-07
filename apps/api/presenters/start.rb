module Api
  module Presenters
    class Start
      include Surrealist

      json_schema do
        {
          playlist_name: String,
          channels: [
            {
              title: String,
              playlist_url: String,
              description: String
            }
          ]
        }
      end

      attr_reader :playlist_name, :channels

      def initialize(playlist_name:, channels:)
        @playlist_name = playlist_name
        @channels = [channels].flatten
      end
    end
  end
end
