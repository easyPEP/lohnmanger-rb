require './test/test_helper'

class LohnmangerTest < Minitest::Test

  def setup
    Lohnmanger.reset!
  end

  def teardown
    Lohnmanger.reset!
  end


  def test_defaults
    Lohnmanger::Configurable.keys.each do |key|
      assert_equal Lohnmanger.instance_variable_get(:"@#{key}"), Lohnmanger::Default.send(key)
    end
  end

  def test_create_client
    assert_kind_of Lohnmanger::Client, Lohnmanger.client
  end

  def test_returns_same_client_if_options_are_same
    assert_same Lohnmanger.client, Lohnmanger.client
  end

  def test_client_hsould_have_default_options
    assert_equal Lohnmanger.client.send(:options), Lohnmanger::Default.options
  end

  def test_setting_config_variables
    Lohnmanger::Configurable.keys.each do |key|
      new_key = "some-random-#{key}"
      Lohnmanger.configure do |config|
        config.send("#{key}=", new_key)
      end
      assert_equal Lohnmanger.instance_variable_get(:"@#{key}"), new_key
    end
  end

end

