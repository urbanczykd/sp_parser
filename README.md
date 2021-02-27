# sp_parser

#Instalation
If you have rvm installed you can just clone the repo and enter the directory it will install correct
ruby version.
If you don't have rvm installed please install any ruby from 2.x best 2.7.x but not required.

#Run it
If you have this file as executable just run it and pass the link to log.
As this is a log parser it's expecting file with .log
```
# if you have +x on parser.rb
./parser.rb ~/path/to/file.log
# if you don't have just run it like that
ruby parser.rb data/webserver.log

# the solution
i thnk now when i'm thinking about it I would write way different,
there should be a way to do it in sequencional way
and maybe even use directories to story all data and in files
just a counters, the printer should just traverse via directory
and collect data, the main problem is that it's collecting in the memory
if the log file will be in tens of Gb this will fail and also for
each line it should be didferent object with some validation
```
