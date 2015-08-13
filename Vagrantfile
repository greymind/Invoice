# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
DOCKER_HOST_NAME = "greymind-dockerhost"
DOCKER_HOST_VAGRANTFILE = "./docker/Vagrantfile"

Vagrant.configure(2) do |config|

  config.vm.define "store" do |v|
    v.vm.provider "docker" do |d|
      d.name = "store"
      
      d.image = "redis"
      
      d.vagrant_machine = "#{DOCKER_HOST_NAME}"
      d.vagrant_vagrantfile = "#{DOCKER_HOST_VAGRANTFILE}"
    end
  end
  
  config.vm.define "db" do |v|
    v.vm.provider "docker" do |d|
      d.name = "db"
      
      d.image = "mongo"
      
      d.vagrant_machine = "#{DOCKER_HOST_NAME}"
      d.vagrant_vagrantfile = "#{DOCKER_HOST_VAGRANTFILE}"
    end
  end
  
  config.vm.define "web" do |v|
    v.vm.provider "docker" do |d|
      d.name = "web"
      
      d.build_dir = "./docker/web"
      d.build_args = ["-t=greymind/web:latest"]

      d.force_host_vm = true
      d.remains_running = false
    
      d.create_args = ["-t", "-i"]
      
      d.ports = ["80:80"]
      d.ports = ["8080:8080"]
      
      d.link("db:db")
      
      d.link("store:store")
      d.env = { 'REDIS_HOST' => 'store' }
      
      d.vagrant_machine = "#{DOCKER_HOST_NAME}"
      d.vagrant_vagrantfile = "#{DOCKER_HOST_VAGRANTFILE}"
    end
    
  end

end