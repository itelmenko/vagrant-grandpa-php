# Vagrant grandpa PHP

It's Vagrant configuration field for machine with php5.3 and Apache. It also has mysql, memchached and php extentions.

# Requerements

* VirtualBox
* vagrant 
* vagrant-hostsupdater

# Installation

Just clone it into any directory and run

```
vagrant up
```

After this you can open default sites http://testhost1.local and http://testhost2.local in your browser.

You also can add your own sites. Just add virtual host config into manifests/assets/ folder.
Call them from manifests/provision.pp. And add your domains into Vagrantfile:

```ruby
config.hostsupdater.aliases = ["testhost1.local", "testhost2.local"]
```
