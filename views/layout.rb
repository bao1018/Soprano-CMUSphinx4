class App
  module Views
    class Layout < Mustache

      def title
        @title || 'Hi!'
      end

      def css
        @css
      end

      def js
        @js
      end

    end
  end
end
