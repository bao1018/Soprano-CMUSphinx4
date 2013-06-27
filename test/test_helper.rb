require_relative '../app'
Bundler.require :test

class App
  class Test < MiniTest::Unit::TestCase

    def self.test(name, &block)
      define_method("test_#{name.gsub(/\W/,'_')}", &block) if block
    end

  end
end
