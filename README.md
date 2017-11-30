## Sensu-Plugins-hardware

[ ![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-hardware.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-hardware)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-hardware.svg)](http://badge.fury.io/rb/sensu-plugins-hardware)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-hardware/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-hardware)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-hardware/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-hardware)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-hardware.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-hardware)

## Functionality
**check-hardware-fail** will lookup in the output of `dmesg` for lines matching a provided query, it accepts `--facility`, `--level` and `--kernel` options to run `dmesg` command. Returns CRITICAL if any occurrence is found and UNKNOWN if provided options are invalid or the command execution fails.

## Files
 * bin/check-hardware-fail

## Usage
Usage: ./check-hardware-fail.rb (options)
    -f FACILITY[,FACILITY],          Restrict output to defined facilities. Supported log facilities: kern,user,mail,daemon,auth,syslog,lpr,news
        --facility
        --invert                     Invert order
    -k, --kernel                     Include kernel messages
    -L, --level LEVEL[,LEVEL]        Restrict output to defined levels, otherwise all levels are included. Supported log levels: emerg,alert,crit,err,warn,notice,info,debug
    -l, --lines NUMBER               Maximum number of lines to read from dmesg, 0 (default) means all
    -q, --query QUERY                What pattern to look for in the output of dmesg (regex or literal)
    -s, --seconds SECONDS            Amount of seconds to lookbehind from dmesg output. This option is incompatible with --lines


Example of usage:

Check the first 100 lines for 'killed as a result of limit'
```
check-hardware-fail.rb -l 100 --invert -q 'killed as a result of limit'
```

Check the last 100 lines for 'killed as a result of limit'
```
check-hardware-fail.rb -l 100 -q 'killed as a result of limit'
```

Only on linux OS:

The following options are only available for linux OS:

`--seconds` Amount of seconds to lookbehind from dmesg output. This option is incompatible with --lines
`--facility` Restrict output to defined facilities. Supported log facilities: kern,user,mail,daemon,auth,syslog,lpr,news
`--level` Restrict output to defined levels, otherwise all levels are included. Supported log levels: emerg,alert,crit,err,warn,notice,info,debug
`--kernel` Include kernel messages

Check the last 300 seconds for 'killed as a result of limit'
```
check-hardware-fail.rb -s 300 -q 'killed as a result of limit'
```

Check the last 300 seconds for 'killed' on auth and syslog facilities
```
check-hardware-fail.rb -s 300 -f auth,syslog -q 'killed'
```


## Installation

[Installation and Setup](http://sensu-plugins.io/docs/installation_instructions.html)

## Notes
