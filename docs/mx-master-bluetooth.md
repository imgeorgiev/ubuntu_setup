# MX Master 2 connect via bluetooth

Simple guide on how to connect the Logitech MX Master 2 to Ubuntu 16.04

For some reason it doens't work via normal bluetooth; sooo
1. Put the mouse in pairing mode
2. start `bluetoothctl`
3. Execute the procedure below
```bash
[bluetooth]# power off
[bluetooth]# power on
[bluetooth]# scan on
[bluetooth]# connect XX:XX:XX:XX:XX:XX
[Arc Touch Mouse SE]# trust
[Arc Touch Mouse SE]# connect XX:XX:XX:XX:XX:XX
[Arc Touch Mouse SE]# pair
[Arc Touch Mouse SE]# unblock
[Arc Touch Mouse SE]# power off
[bluetooth]# power on
```

