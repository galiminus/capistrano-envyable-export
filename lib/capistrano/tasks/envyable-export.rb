require 'pathname'
require 'envyable'

namespace :envyable do
  desc 'Export the .env file to the remote servers'
  task :export do
    on roles fetch(:envyable_roles) do
      execute(:mkdir, "-p", Pathname.new(fetch(:envyable_export_path)).dirname)

      env = {}.tap do |env|
        Envyable::Loader.new(fetch(:envyable_local_path), env).load(fetch(:stage).to_s)
      end.map { |k, v| "#{k}=#{v}" }.join("\n")

      upload! StringIO.new(env), fetch(:envyable_export_path, -> { fetch(:envyable_export_path) })
    end
  end
end

namespace :load do
  task :defaults do
    set :envyable_roles, fetch(:envyable_roles, :all)
    set :envyable_local_path, fetch(:envyable_local_path, "config/env.yml")
    set :envyable_export_path, ".env"
  end
end
