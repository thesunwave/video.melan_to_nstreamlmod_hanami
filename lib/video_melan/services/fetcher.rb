module VideoMelan
  module Services
    class Fetcher
      attr_reader :kind, :movie_id

      def initialize(kind:, movie_id: nil)
        @kind = kind
        @movie_id = movie_id
      end

      def call
        case kind
        when :main
          Parsers::MainPage.new.call
        when :get_film
          Parsers::FilmPage.new(movie_id: movie_id).call
        # when :new
          # FromRssService.new(hostname: @hostname).call
        else
          {}
        end
      end
    end
  end
end
