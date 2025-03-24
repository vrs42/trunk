The following is not actually working.


The contents of this directory control a service that runs SerialDisk
automatically.

The service essentially starts the following command:

$ sudo tester /home/tester/sd/server -1 /home/tester/sd/sd0 \
    -2 /home/tester/sd/sd1 -3 /home/tester/sd/sd2 -4 /home/tester/sd/sd3

This was done after too much struggling with local networks to get SSH to
work well enough to start the server manually.

To install the service, run the install script:
$ sudo ./installsdsvc

    Vince
