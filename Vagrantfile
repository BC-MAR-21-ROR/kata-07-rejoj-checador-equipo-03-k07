# frozen_string_literal: true

Vagrant.configure(2) do |config|
  {
    postgres: [
      {
       tag: "13.2-alpine",
       map: "5433:5432", # port mapping
       env: { "POSTGRES_HOST_AUTH_METHOD" => "trust" }
      }
    ]
  }.each do |service, versions|
    versions.each do |v|
      config.vm.define "#{service}:#{v[:tag].split("-").first}" do |definition| #postgres:13.2
        definition.vm.provider "docker" do |docker|
          docker.image = "#{service}:#{v[:tag]}"
          docker.ports = [v[:map]] if v[:map]
          docker.env   = v[:env] if v[:env]
        end
      end
    end
  end
end
