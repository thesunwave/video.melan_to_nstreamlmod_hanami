module VideoMelan
  module Services
    class Search
      URL = URI.join(ENV.fetch('MELAN_URL'), 'suggestion.php').to_s

      def initialize(query)
        @query = query
      end

      def call
        parsed = JSON.parse(response)
        result = parsed['json'][0]['response']['movies'].map do |movie|
          {
              title: movie['name'],
              logo: '',
              playlist_url: Api.routes.url(:film, movie['movie_id']),
              description: "<img src='#{ENV.fetch('MELAN_URL')}#{movie['cover']}'>"
          }
        end

        result.empty? ? fallback : result
      end

      private

      attr_reader :query, :hostname

      def response
        @response ||= RestClient.get(URL, { params: { q: query } })
      end

      def fallback
        [
            {
                title: 'Ничего не найдено',
                logo: '',
                playlist_url: '',
                description: ""
            }
        ]
      end

    end
  end
end