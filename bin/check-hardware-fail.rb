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

require 'English'
require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'sensu-plugin/check/cli'

class CheckHardwareFail < Sensu::Plugin::Check::CLI
  option :lines,
         short: '-l NUMBER',
         long: '--lines NUMBER',
         proc: proc(&:to_i),
         default: 0,
         description: 'Maximum number of lines to read from dmesg, 0 (default) means all'

  option :query,
         short: '-q QUERY',
         long: '--query QUERY',
         default: 'Hardware Error',
         description: 'What pattern to look for in the output of dmesg (regex or literal)'

  option :invert,
         long: '--invert',
         description: 'Invert order',
         boolean: true,
         default: false

  def run
    cmd = config[:invert] ? 'head' : 'tail'
    output = if config[:lines].zero?
               `dmesg`.lines.select { |l| l[/#{config[:query]}/] }
             else
               `dmesg | #{cmd} -n #{config[:lines]}`.lines.select { |l| l[/#{config[:query]}/] }
             end
    unknown 'Command execution failed!' unless $CHILD_STATUS.success?
    critical "Problem Detected: #{output[0]}" if output.any?
    ok 'OK'
  end
end
