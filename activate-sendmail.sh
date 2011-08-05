#!/bin/bash
cd /etc/mail
/usr/bin/make
/usr/bin/newaliases
/etc/init.d/sendmail restart
/etc/init.d/spamassassin restart

