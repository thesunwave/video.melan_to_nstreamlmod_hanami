module Api
  module Presenters
    class Main
      include Surrealist

      attr_reader :playlist_name, :channels

      def initialize(playlist_name: 'Главная', channels: [])
        @playlist_name = playlist_name
        @channels = channels
      end

      def as_json
        {
          playlist_name: playlist_name,
          channels: channels
        }.to_json
      end
    end
  end
end
