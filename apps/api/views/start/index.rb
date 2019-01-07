module Api
  module Views
    module Start
      class Index
        include Api::View

        def render
          _raw start_list.to_json
        end
      end
    end
  end
end
