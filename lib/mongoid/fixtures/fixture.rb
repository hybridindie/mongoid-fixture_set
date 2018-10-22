require 'mongoid/fixtures/errors'

module Mongoid
  class Fixtures
    class Fixture
      include Enumerable

      attr_reader :name, :fixture, :model_class
      def initialize(name, fixture, model_class)
        @name         = name
        @fixture      = fixture
        @model_class  = model_class
      end

      def class_name
        model_class.name if model_class
      end

      def each
        fixture.each { |item| yield item }
      end

      def [](key)
        fixture[key]
      end

      alias :to_hash :fixture

      def find
        raise FixtureClassNotFound, 'No class attached to find.' unless model_class

        model_class.unscoped do
          model_class.find_by('__fixture_name' => name)
        end

      end
    end
  end
end
