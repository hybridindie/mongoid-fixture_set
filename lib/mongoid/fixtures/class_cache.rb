class ClassCache
  def initialize(class_names)
    @class_names = class_names.stringify_keys
    # Remove string values that aren't constants or subclasses of Mongoid::Document
    @class_names.delete_if { |klass_name, klass| !insert_class(@class_names, klass_name, klass) }
  end

  def [](fs_name)
    @class_names.fetch(fs_name) {
      klass = default_fixture_model(fs_name).safe_constantize
      insert_class(@class_names, fs_name, klass)
    }
  end

  private

  def insert_class(class_names, name, klass)
    # We only want to deal with Mongoid objects.
    class_names[name] = klass if klass && klass < Mongoid::Document
  end

  def default_fixture_model(fs_name)
    Mongoid::Fixtures.default_fixture_model_name(fs_name)
  end
end

