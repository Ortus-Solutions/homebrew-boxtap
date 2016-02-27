Ortus Solutions Homebrew Tap
============================

This is the Ortus Solutions tap repository for Box products which may be installed using the OSX [Homebrew][1] package manager.  It allows the ability to install and test homebrew installation packages.  This tap may be pinned to override the upstream source used in [Homebrew][1] installations.

Usage
-----

- To use this tap, run `brew tap ortus-solutions/boxtap` from your terminal.
- To install a package from this tap:
  
  `brew install ortus-solutions/boxtap/[package]`

- To pin this tap, prioritizing all packages in it above the official Homebrew packages:

  `brew tap-pin ortus-solutions/boxtap`

- To unpin and revert formulae priority to the official Hombrew repo:

  `brew tap-unpin ortus-solutions/boxtap`


Maintance and Additions
----------------------

Valid Homebrew formula may be created and added to the repository.  See the [Homebrew Formula Cookbook][2] for additional information on creating homebrew installation formulae.

Formula updates must include an updated SHA256 hash of the downloadable `.zip` or `.tgz` package.  

Formula which are overwritten during an automated build and deploy cycle should have their tap file updated to reflect the current hash or installations from this tap will fail.


[1]: http://brew.sh/
[2]: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
