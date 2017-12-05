#! /usr/bin/env ruby
#
#   check-hardware-fail
#
# DESCRIPTION:
#   Check dmesg for failing hardware
#   Detects things like overheating CPUs, dying hard drives, etc.
#
# OUTPUT:
#   plain text
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#
# USAGE:
#
# NOTES:
#
# LICENSE:
#   Shank Feek, Alan Smith
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'os'
require 'English'
require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'sensu-plugin/check/cli'

class CheckHardwareFail < Sensu::Plugin::Check::CLI
  option :lines,
         short: '-l NUMBER',
         long: '--lines NUMBER',
         proc: proc(&:to_i),
         description: 'Maximum number of lines to read from dmesg, 0 (default) means all'

  option :query,
         short: '-q QUERY',
         long: '--query QUERY',
         default: 'Hardware Error',
         description: 'What pattern to look for in the output of dmesg (regex or literal)'

  option :seconds,
         short: '-s SECONDS',
         long: '--seconds SECONDS',
         proc: proc(&:to_i),
         description: 'Amount of seconds to lookbehind from dmesg output. This option is incompatible with --lines'

  option :facility,
         short: '-f FACILITY[,FACILITY]',
         long: '--facility FACILITY[,FACILITY]',
         description: 'Restrict output to defined facilities. Supported log facilities: kern,user,mail,daemon,auth,syslog,lpr,news',
         required: false,
         proc: proc { |a| a.split(',') }

  option :level,
         short: '-L LEVEL[,LEVEL]',
         long: '--level LEVEL[,LEVEL]',
         description: 'Restrict output to defined levels, otherwise all levels are included. Supported log levels: emerg,alert,crit,err,warn,notice,info,debug',
         proc: proc { |a| a.split(',') }

  option :kernel,
         short: '-k',
         long: '--kernel',
         description: 'Include kernel messages',
         boolean: true

  option :invert,
         long: '--invert',
         description: 'Invert order',
         boolean: true

  def run
    # Validate options
    unknown incompatible_options if incompatible_options

    # Build the command based on the options provided
    cmd = 'dmesg '
    cmd += "--facility #{config[:facility].join(',')} " if config[:facility]
    cmd += "--level #{config[:level].join(',')} " if config[:level]
    cmd += '--kernel ' if config[:kernel]

    # Run command
    lines = `#{cmd}`.lines
    unknown 'Command execution failed!' unless $CHILD_STATUS.success?

    if config[:seconds]
      uptime = File.read('/proc/uptime').split(' ').first.to_i
      seconds_limit = uptime - config[:seconds]
    end

    # Option --invert
    # Flipping the array to start the iteration from the last line (newest entry)
    # unless `--invert` which means that you want to start reading from the first line (oldest entry)
    lines.reverse! unless config[:invert]

    output = []

    lines.each_with_index do |line, index|
      break if config[:lines] && index >= config[:lines]
      if config[:seconds]
        timestamp = line.split(']').first.delete('[').to_i
        break if timestamp < seconds_limit
      end
      output << line if line[/#{config[:query]}/]
    end

    critical "Problem Detected: #{output[0]}" if output.any?
    ok 'OK'
  end

  def incompatible_options
    if OS.linux?
      if incompatible_linux.any?
        "The use of the options --seconds and [--#{incompatible_linux.join(' --')}] is incompatible."
      elsif invalid_facility.any?
        "Invalid dmesg facility requested: #{invalid_facility}"
      elsif invalid_level.any?
        "Invalid dmesg level requested: #{invalid_level}"
      end
    elsif OS.posix?
      "Incompatible options: [--#{incompatible_posix.join(' --')}] for OS #{OS.host_os}" if incompatible_posix.any?
    else
      "OS #{OS.host_os} is not supported"
    end
  end

  def incompatible_linux
    config[:seconds] ? config.keys & %i[lines invert] : []
  end

  def incompatible_posix
    config.keys & %i[facility level kernel seconds]
  end

  def invalid_facility
    config[:facility].to_a - %w[kern user mail daemon auth syslog lpr news]
  end

  def invalid_level
    config[:level].to_a - %w[emerg alert crit err warn notice info debug]
  end
end
