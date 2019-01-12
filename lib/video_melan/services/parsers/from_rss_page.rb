module VideoMelan
  module Services
    module Parsers
      class FromRssPage
        def initialize
          @url = URI.join(ENV.fetch('MELAN_URL'), "/rss_films.php").to_s
        end

        def call
          response.xpath('//item').map do |item|
            {
                title: item.at_xpath('title').content,
                logo: '',
                playlist_url: Api.routes.url(:film, film_id(item)),
                description: item.at_xpath('content:encoded').content
            }
          end
        end

        private

        attr_reader :url

        def response
          @response ||= Nokogiri::XML(RestClient.get(url))
        end

        def film_id(item)
          item.at_xpath('link').content.split('/').last
        end
      end
    end
  end
end