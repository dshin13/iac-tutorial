Vagrant.configure("2") do |config|
  # define provider configuration
  config.vm.provider :virtualbox do |v|
    v.memory = 1024
  end
  # define VM macine configuration
  config.vm.define "raddit-app" do |app|
    # define image and name
    app.vm.box = "ubuntu/xenial64"
    app.vm.hostname = "raddit-app"

    # sync a local folder with app to the VM
    app.vm.synced_folder "raddit-app/", "/srv/raddit-app"

    # use port forwarding to make app accessible on localhost
    app.vm.network "forwarded_port", guest: 9292, host: 9292

    # use Ansible to manage system config
    app.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/configuration.yml"
    end
  end
end
