#### Mini Monitor

This is a very primitive implementation of a monitoring system/check.  The reason I wrote this was I had a server bouncing soon which did not have services capable of starting via upstart or SystemD and must be manually started.

To get this working on your machine/server/etc you'll need to do the following:

* Make sure you have the latest Ruby installed using rbenv or rvm (Google this
* Install the `twilio-ruby` API wrapper `gem install twilio-ruby` so that the gem is bundled inside of your rbenv shims path
* Enter your Twilio SID and Token
* Enter your Twilio phone number and your target number where you'd like to be called
* Finally in the `port_open?()` method that runs at the end of the script, simply enter the FQDN or IP address of the host you want to port check on, the second argument being the actual port you want to monitor.

You can have this running in a screen session if you like but that's kind of sloppy. I'd suggest putting this in your home directory, making sure your path is set properly, then schedule it in cron to run at the interval you want it to.

I'll be expanding this as time goes on, but this was 10 minutes of tinkering and a quick/dirty fix to my problem.
