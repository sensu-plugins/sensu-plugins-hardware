# Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format listed at [Keep A Changelog](http://keepachangelog.com/)

## [Unreleased]

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

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-hardware/compare/1.1.0...HEAD
[1.1.0]: https://github.com/sensu-plugins/sensu-plugins-hardware/compare/1.0.0...1.1.0
[1.0.0]: https://github.com/sensu-plugins/sensu-plugins-hardware/compare/0.0.4...1.0.0
[0.0.4]: https://github.com/sensu-plugins/sensu-plugins-hardware/compare/0.0.3...0.0.4
[0.0.3]: https://github.com/sensu-plugins/sensu-plugins-hardware/compare/0.0.2...0.0.3
[0.0.2]: https://github.com/sensu-plugins/sensu-plugins-hardware/compare/0.0.1...0.0.2
