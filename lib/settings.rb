require "settings/version"
require 'active_support/hash_with_indifferent_access'

class Settings
  class ESettingsMissing < Exception; end
  class SettingsHash < ::HashWithIndifferentAccess
    def [](setting)
      result = super(setting.to_s)
      case result
      when Hash, nil
        SettingsHash.new(result)
      else
        result
      end
    end

    def []=(k, value)
      super(k.to_s, value)
    end
  end

  def self.[](setting)
    all[setting]
  end

  def self.all
    @all ||= SettingsHash.new(create_or_read_settings_file[Rails.env])
  end

  def self.settings_file
    File.expand_path('config/settings.yml')
  end

  def self.create_or_read_settings_file
    if !File.exist?(settings_file)
      raise ESettingsMissing, "Settings file #{settings_file} missing; example contents should be:\n#{{"development" => {'your_settings_here' => 'ok?'}}.to_yaml}"
    end
    YAML.load(File.read(settings_file))
  end
end