require 'pathname'
require 'envyable'
require 'yaml'

namespace :envyable do
  desc 'Export the .env file to the remote servers'
  task :export do
    on roles fetch(:envyable_roles) do
      env = {}.tap do |env|
        Envyable::Loader.new(fetch(:envyable_path), env).load(fetch(:stage).to_s)
      end

      upload! StringIO.new(YAML.dump(env)), "#{release_path}/#{fetch(:envyable_path)}"
      if fetch(:envyable_env_path)
        execute(:mkdir, "-p", Pathname.new(fetch(:envyable_env_path)).dirname)
        upload! StringIO.new(env.map { |k, v| "#{k}=#{v}" }.join("\n")), fetch(:envyable_env_path)
      end
    end
  end

  before 'deploy:publishing', 'envyable:export'
end

namespace :load do
  task :defaults do
    set :envyable_roles, fetch(:envyable_roles, :all)
    set :envyable_path, fetch(:envyable_path, "config/env.yml")
  end
end
