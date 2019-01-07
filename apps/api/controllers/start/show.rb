module Api
  module Controllers
    module Start
      class Show
        include Api::Action
        accept :json

        expose :start_list

        def call(params)
          # binding.pry
          @start_list = {
            playlist_name: 'Video.Melan',
            channels: [
                {
                    title: 'Главная',
                    playlist_url: routes.path(:main),
                    description: 'Фильмы с главной'
                },
                {
                    title: 'Новые',
                    playlist_url: routes.path(:new),
                    description: 'Недавно добавленные фильмы'
                },
                {
                    title: "Поиск",
                    search_on: "Поиск по каталогу",
                    logo: '',
                    playlist_url: routes.path(:search),
                    description: "Поиск по всему каталогу Video.Melan"
                }
              ]
          }
        end
      end
    end
  end
end
