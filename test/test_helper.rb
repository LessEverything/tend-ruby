$:.push File.expand_path("../lib", __FILE__)

require 'minitest/autorun'
require 'minitest/pride'
require "vcr"

module Test;end
module Test::Helpers;end

require "tend"
require "helpers/all"
require "helpers/no_find"
require "helpers/no_create"
require "helpers/no_update"
require "helpers/no_delete"

Tend.user_name = "stevenbristol@gmail.com"
Tend.password = "NqNo3bwWZu"



VCR.configure do |config|
  config.cassette_library_dir = "test/fixtures/vcr"
  config.hook_into :webmock # or :fakeweb
end

def fixture file_name, key
  json = File.read( "test/fixtures/#{file_name}.json" )
  JSON.parse( json )[key]
end


def assert_tend_class class_name, meth, *args
  cla = "Tend::#{class_name.titleize}".constantize
  x = meth.split "|"
  m = x.first
  key = x.first == x.last ? "#{m}" : "#{m}_#{x.last}"
  file_name = "#{class_name}_#{key}"
  VCR.use_cassette(file_name) do
    fix = fixture(class_name, key)
    tend = args.empty? ? cla.send(m) : cla.send(m, *args)
    if fix.is_a? Array
      assert_equal fix.size, tend.size, "The array returned by Tend is not the same size as the fixture array."
      fix.each_with_index do |f, index|
        assert_tend_object f, tend[index]
      end
    else
      assert_tend_object fix, tend
    end
  end
end

def assert_tend_instance instance, meth, *args
  class_name = instance.class.to_s.gsub("Tend::", "").downcase
  VCR.use_cassette("#{class_name}_#{meth}") do
    fix = fixture(class_name, meth)
    tend = args.empty? ? instance.send(meth) : instance.send(meth, *args)
    if fix.is_a? Array
      assert_equal fix.size, tend.size, "The array returned by Tend is not the same size as the fixture array."
      fix.each_with_index do |f, index|
        assert_tend_object f, tend[index]
      end
    else
      assert_tend_object fix, tend
    end
  end
end

def assert_tend_object fixture, tend
  if fixture['message']
    assert_equal fixture["message"], tend
  else
    fixture.each do |k, v|
      assert_equal v, tend.send(k), "Attribute #{k} does not match"
    end
    assert_equal fixture, tend.attributes, "Attributes do not match"
  end
end



