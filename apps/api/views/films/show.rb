module Api
  module Views
    module Films
      class Show
        include Api::View

        def render
          _raw list.as_json
        end
      end
    end
  end
end
