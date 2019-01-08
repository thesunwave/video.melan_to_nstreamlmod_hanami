module VideoMelan
  module Services
    module Parsers
      class FilmPage
        attr_reader :movie_id

        def initialize(movie_id:)
          @movie_id = movie_id
        end

        def call
          parse
        end

        private

        def parse
          # binding.pry
          browser.goto URI.join(ENV.fetch('MELAN_URL'), "/#/movie/id/#{movie_id}").to_s

          while browser.execute_script("return jQuery('.files').size()") == 0
            sleep 1
          end

          result = browser.div(class: 'files').table.trs.map do |item|
            {
                title: item.td(class: 'name').text,
                logo: '',
                stream_url: item.link.href,
                # stream_url: "#{item.link.href.gsub('http://video.melan', Api.routes.url(:root))}",
                description: "#{item.td(class: 'name').text} - #{item.link.text.gsub('Скачать ', '')}".prepend("<div>#{browser.div(class: 'info').text}</div>")
            }
          end

          title = browser.title.split('/')[0..1].join(' - ')

          browser.quit

          Hash[playlist_name: title, channels: result]
        end

        def browser
          if RUBY_PLATFORM.match(/arm/)
            @browser ||= ::Watir::Browser.new :chrome, headless: true, options: { args: ['disable-gpu', 'no-sandbox', 'disable-dev-shm-usage'], binary: "/usr/bin/chromium" }
          else
            @browser ||= ::Watir::Browser.new :chrome, headless: true
          end
        end
      end
    end
  end
end
