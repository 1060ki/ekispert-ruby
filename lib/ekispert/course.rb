module Ekispert
  class Course
    class << self

      # @see http://docs.ekispert.com/v1/api/search/course/extreme.html
      def get(**args)
        Ekispert.client.get('search/course/extreme', args)
      end
    end
  end
end
