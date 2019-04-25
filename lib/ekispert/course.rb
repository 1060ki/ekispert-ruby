require_relative 'camelizable'

module Ekispert
  class Course
    include Camelizable

    class << self

      # @see http://docs.ekispert.com/v1/api/search/course/extreme.html
      def get(**args)
        Ekispert.client.get('search/course/extreme', camelize_hash(args))
      end
    end
  end
end
