## Sensu-Plugins-hardware

[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-hardware.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-hardware)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-hardware.svg)](http://badge.fury.io/rb/sensu-plugins-hardware)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-hardware/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-hardware)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-hardware/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-hardware)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-hardware.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-hardware)
[ ![Codeship Status for sensu-plugins/sensu-plugins-hardware](https://codeship.com/projects/0f4809d0-db96-0132-9804-0eed4ec53b27/status?branch=master)](https://codeship.com/projects/79665)

## Functionality

## Files
 * bin/check-hardware-fail

## Usage

## Installation

Add the public key (if you haven’t already) as a trusted certificate

```
gem cert --add <(curl -Ls https://raw.githubusercontent.com/sensu-plugins/sensu-plugins.github.io/master/certs/sensu-plugins.pem)
gem install sensu-plugins-hardware -P MediumSecurity
```

You can also download the key from /certs/ within each repository.

#### Rubygems

`gem install sensu-plugins-hardware`

#### Bundler

Add *sensu-plugins-disk-checks* to your Gemfile and run `bundle install` or `bundle update`

#### Chef

Using the Sensu **sensu_gem** LWRP
```
sensu_gem 'sensu-plugins-hardware' do
  options('--prerelease')
  version '0.0.1'
end
```

Using the Chef **gem_package** resource
```
gem_package 'sensu-plugins-hardware' do
  options('--prerelease')
  version '0.0.1'
end
```

## Notes
