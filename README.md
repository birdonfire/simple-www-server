Simple WWW Server
=================

This is a simple Vagrant virtual machine that runs an nginx server pre-configured to serve static content out of the `www` directory.

It's great for sharing simple prototypes or sensitive documents with your team.

When you run the machine, it binds to your local IP address on port 8800, e.g. http://10.10.10.10:8800/. Share that link with your team, and they should be able to see the content

Pre-requisites
--------------
You'll need to install a couple things to make this work:

1. [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads) version 5.0 or later
1. [Vagrant](https://www.vagrantup.com/downloads.html) version 1.7.4 or later

Running
-------
To start up your server, open a terminal, navigate to this directory (the one containing the `Vagrantfile`) and execute:

    $ vagrant up

That's it. You should now be able to access the server using your local IP (not the IP of the vagrant VM) on port 8800.

Shutdown
--------
To shutdown your server, open a terminal, navigate to this directory (the one containing the `Vagrantfile`) and execute:

    $ vagrant suspend

Or

    $ vagrant halt

Suspend will make the next startup a little quicker, so it's usually preferable to a full halt.

Configuration
-------------
The server is ready to use out of the box, but you can adjust configs.

### Port
You can use a different port by change the `forwarded_port` setting in the `Vagrantfile`.

### nginx

Nginx is installed and configured by the `vagrant/install.sh` script. See the `CONF_FILE_CONTENTS` variable in the script for the actual configuration.

Serving content
---------------
The `www` directory is the root context for the server. Any files you add to the directory will be accessible.

For example, the `index.html` file that ships with this project would be accessible at http://your.ip.address:8800/ or http://your.ip.address:8800/index.html.

Troubleshooting
---------------

### Port already in use
Do you already have an app running locally on port 8800? If so, you could

1. Shutdown the other app
2. Run the other app on a different port
3. [Configure](#port) the VM to run on a different port.

### Other folks can't connect
If other folks can't connect to the VM, there could be a few things going on.

Some things to check

1. Can you connect to it?
1. Can the other folks successfully ping your IP address?
1. Are you and the other user on different VPNs?
1. If you're sharing over a VPN, did you use your VPN IP address?
1. Do you have a local firewall running on your box, preventing external connections?
