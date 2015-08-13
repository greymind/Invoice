# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define "store" do |v|
    v.vm.provider "docker" do |d|
      d.name = "store"
      
      d.image = "redis"
      
      d.vagrant_vagrantfile = "./docker/Vagrantfile"
    end
  end
  
  config.vm.define "db" do |v|
    v.vm.provider "docker" do |d|
      d.name = "db"
      
      d.image = "mongo"
      
      d.vagrant_vagrantfile = "./docker/Vagrantfile"
    end
  end
  
  config.vm.define "web" do |v|
    v.vm.provider "docker" do |d|
      d.name = "web"
      
      d.build_dir = "./docker/web"
      d.build_args = ["-t=greymind/web:latest"]

      d.force_host_vm = true
      d.remains_running = false
    
      #d.cmd = ["/bin/sh", "-c", "while true; do echo hello world; sleep 1; done"]
      #d.cmd = ["http-server"]
      
      d.create_args = ["-t", "-i"]
      d.ports = ["8080:8080"]
      d.link("db:db")
      
      d.link("store:store")
      d.env = { 'REDIS_HOST' => 'store' }
      
      d.vagrant_vagrantfile = "./docker/Vagrantfile"
    end
    
    v.vm.synced_folder "./", "/src"
  end

end