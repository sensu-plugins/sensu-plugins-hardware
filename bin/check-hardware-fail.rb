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

require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'sensu-plugin/check/cli'

class CheckHardwareFail < Sensu::Plugin::Check::CLI
  def run
    errors = `dmesg`.lines.select { |l| l['[Hardware Error]'] }
    critical 'Hardware Error Detected' if errors.any?
    ok 'Hardware OK'
  end
end
