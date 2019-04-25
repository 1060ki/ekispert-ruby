module Ekispert
  module Camelizable
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def camelize(string)
        string.gsub(/(?:_|(\/))([a-z\d]*)/) { "#{$1}#{$2.capitalize}" }
      end

      def camelize_hash(hash)
        hash.transform_keys { |k| camelize(k.to_s).to_sym }
      end
    end
  end
end
