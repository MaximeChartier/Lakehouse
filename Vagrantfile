ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'

Vagrant.configure("2") do |config|
    config.vm.define "kube1" do |config|
        config.vm.hostname = "kube1"
        config.vm.box = "generic/debian10"
        config.vm.box_check_update = false
        config.vm.network "private_network", ip: "192.168.50.11"
        config.vm.provider :libvirt do |v|
            v.memory = 6144
            v.cpus = 4
        end
        config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
        config.vm.provision "shell", inline: <<-SHELL
            mkdir /root/.ssh/
            cat /home/vagrant/.ssh/me.pub >> /root/.ssh/authorized_keys
            chmod 600 -R /root/.ssh/
        SHELL
    end
    config.vm.define "kube2" do |config|
        config.vm.hostname = "kube2"
        config.vm.box = "generic/debian10"
        config.vm.box_check_update = false
        config.vm.network "private_network", ip: "192.168.50.12"
        config.vm.provider :libvirt do |v|
            v.memory = 6144
            v.cpus = 4
        end
        config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
        config.vm.provision "shell", inline: <<-SHELL
            mkdir /root/.ssh/
            cat /home/vagrant/.ssh/me.pub >> /root/.ssh/authorized_keys
            chmod 600 -R /root/.ssh/
        SHELL
    end
    config.vm.define "kube3" do |config|
        config.vm.hostname = "kube3"
        config.vm.box = "generic/debian10"
        config.vm.box_check_update = false
        config.vm.network "private_network", ip: "192.168.50.13"
        config.vm.provider :libvirt do |v|
            v.memory = 6144
            v.cpus = 4
        end
        config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
        config.vm.provision "shell", inline: <<-SHELL
            mkdir /root/.ssh/
            cat /home/vagrant/.ssh/me.pub >> /root/.ssh/authorized_keys
            chmod 600 -R /root/.ssh/
        SHELL
    end
end