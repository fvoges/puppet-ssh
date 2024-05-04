# fvoges-ssh

[![nightly](https://github.com/fvoges/puppet-ssh/actions/workflows/nightly.yaml/badge.svg)](https://github.com/fvoges/puppet-ssh/actions/workflows/nightly.yaml)

Puppet module to manage SSH. 

## Table of Contents

## Overview

This module does not manage the ssh/sshd configuration. It only ensures that the necessary package(s), config files, and service are installed.

Use the [puppet/augeasproviders_ssh](https://forge.puppet.com/puppet/augeasproviders_ssh) module to manage the configuration.

## Module Description

[puppet/augeasproviders_ssh](https://forge.puppet.com/puppet/augeasproviders_ssh) is great but it only manages the configuration files.

This module complements it by managing the rest: packages, services, and config file permissions.

## Usage

The basic usage requires no parameters

```puppet
include ssh
```

### Reference

See [REFERENCE.md](REFERENCE.md) for the full reference.

## Limitations

The module doesn't manage the configuration files contents, just their presence and permissions.

## Development

Feel free to send bug reports and pull requests to the project page.
