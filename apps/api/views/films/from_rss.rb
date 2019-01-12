module Api
  module Views
    module Films
      class FromRss
        include Api::View

        def render
          _raw list.as_json
        end
      end
    end
  end
end
