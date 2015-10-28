# Source

* [This blog article](https://blog.bigdinosaur.org/running-bind9-and-isc-dhcp/)

# What does it do

This docker spawns a DHCP and DNS server, to assign IP addresses and FQDN to hosts on a private network.

# Usage

* Generate rndc-key with `/usr/sbin/rndc-confgen -a`, output should be `wrote key file "/etc/bind/rndc.key"`


* Put the generated key in :

```
conf/bind/named.conf.local
conf/bind/rndc.key
conf/dhcp/dhcpd.conf
```

* Edit `config/dhcp/dhcp.conf` to add hosts w/ MAC address .

* Start the Docker with `--net=host`.
