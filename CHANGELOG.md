# Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format listed at [Our CHANGELOG Guidelines](https://github.com/sensu-plugins/community/blob/master/HOW_WE_CHANGELOG.md)

## [Unreleased]
### Added
- Options `--facility`, `--level` and `--kernel` to restrict dmesg output on linux OS (@epierotto)
- Option `--seconds` to specify the amount of seconds to lookbehind on dmesg output on linux OS (@epierotto)
- Options validation to prevent running incompatible arguments (@epierotto)

### Changed
- updated changelog guidelines location (@majormoses)
- Replaced the use of `tail` and `head` commands when specifying the option `--invert`, now uses pure ruby (@epierotto)
- Updated rubocop version to 0.49.0 (@epierotto)
- Rubocop test pass (@epierotto)

## [1.2.0] - 2017-11-02
### Changed
- check-hardware-fail.rb: Return the actual and entire query line match if found (@phantasm66)

## [1.1.0] - 2017-07-17
### Added
- Option to limit the number of lines to be parsed from the dmesg output
- Option to specify what pattern (regex) to look for in the dmesg output

## [1.0.0] - 2017-06-14
### Added
- Support for Ruby 2.3 and 2.4 (@eheydrick)

### Removed
- Support for Ruby < 2 (@eheydrick)

### Changed
- Loosen `sensu-plugin` dependency to `~> 1.2` (@mattyjones)

## [0.0.4] - 2015-12-02
### Fixed
- Fix ruby utf8 byte sequence error

## [0.0.3] - 2015-07-14
### Changed
- updated sensu-plugin gem to 1.2.0

## 0.0.1 - 2015-04-30

### Added
- initial release

## [0.0.2] - 2015-06-02
### Fixed
- added binstubs

### Changed
- removed cruft from /lib

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-hardware/compare/1.2.0...HEAD
[1.2.0]: https://github.com/sensu-plugins/sensu-plugins-hardware/compare/1.1.0...1.2.0
[1.1.0]: https://github.com/sensu-plugins/sensu-plugins-hardware/compare/1.0.0...1.1.0
[1.0.0]: https://github.com/sensu-plugins/sensu-plugins-hardware/compare/0.0.4...1.0.0
[0.0.4]: https://github.com/sensu-plugins/sensu-plugins-hardware/compare/0.0.3...0.0.4
[0.0.3]: https://github.com/sensu-plugins/sensu-plugins-hardware/compare/0.0.2...0.0.3
[0.0.2]: https://github.com/sensu-plugins/sensu-plugins-hardware/compare/0.0.1...0.0.2
