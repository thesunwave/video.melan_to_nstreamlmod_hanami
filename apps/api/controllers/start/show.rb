module Api
  module Controllers
    module Start
      class Show
        include Api::Action
        accept :json

        expose :start_list

        def call(params)
          @start_list = {
            playlist_name: 'Video.Melan',
            channels: [
                {
                    title: 'Главная',
                    playlist_url: routes.url(:main),
                    description: 'Фильмы с главной'
                },
                {
                    title: 'Новые',
                    playlist_url: routes.url(:from_rss_films),
                    description: 'Недавно добавленные фильмы'
                },
                {
                    title: "Поиск",
                    search_on: "Поиск по каталогу",
                    logo: '',
                    playlist_url: routes.url(:search),
                    description: "Поиск по всему каталогу Video.Melan"
                }
              ]
          }
        end
      end
    end
  end
end
