module VideoMelan
  module Services
    module Parsers
      class MainPage
        def call
          parse
        end

        private

        def parse
          browser.goto ENV.fetch('MELAN_URL')

          while browser.execute_script("return jQuery('.item').size()") == 0
            sleep 1
          end

          result = browser.divs(class: 'item').map do |item|
            {
                title: item.text,
                logo: '',
                playlist_url: Api.routes.url(:film, item.link.href.split('/').last),
                description: "<img src='#{item.image.src}'>"
            }
          end

          browser.quit
          result
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
