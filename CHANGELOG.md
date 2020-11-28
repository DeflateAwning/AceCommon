# Changelog

* Unreleased
* 1.1.2 (2020-11-28)
    * Minor header include fix for compatility with UnixHostDuino.
    * Fix various compilation warnings and errors on AVR compiler.
    * No functional change in this release.
* 1.1.1 (2020-11-02)
    * Move `src/fstrings/FCString.h` from AceRoutine to AceCommon library.
    * Fix typos and broken links in README.md files and example code.
* 1.1 (2020-10-29)
    * Split `src/ace_common` to `src/arithmetic` and `src/pstrings`.
    * Move `src/print_str` from AceUtils to AceCommon library.
    * Move `src/print_utils` from AceUtils to AceCommon library.
    * Move `src/timing_stats` from AceUtils to AceCommon library.
    * Move `src/url_encoding` from AceUtils to AceCommon library.
* 1.0 (2020-10-20)
    * Add `src/ace_common/arithmetic.h` and unit tests
    * Add `src/ace_common/pstrings.h` and unit tests
    * Add `udiv1000()` to `arithmetic.h`
    * Add GitHub Actions workflow for continuous integration and testing.
