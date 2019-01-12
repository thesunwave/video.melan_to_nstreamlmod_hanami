module Api
  module Views
    module Search
      class Show
        include Api::View

        def render
          _raw list.as_json
        end
      end
    end
  end
end
