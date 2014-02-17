# httpd cookbook
test
test
test5
test2
test3
actions
alias
asis
auth_basic
auth_digest
authn_alias
authn_anon
authn_dbd
authn_dbm
authn_default
authn_file
authnz_ldap
authz_dbm
authz_default
authz_groupfile
authz_host
authz_owner
authz_user
autoindex
cache
cern_meta
cgid
cgi
dav_fs
dav
dbd
deflate
dir
disk_cache
dumpio
env
expires
ext_filter
file_cache
filter
headers
ident
imagemap
include
info
ldap
log_config
log_forensic
logio
mem_cache
mime_magic
mime
negotiation
proxy_ajp
proxy_balancer
proxy_connect
proxy_ftp
proxy_http
proxy
reqtimeout
rewrite
setenvif
speling
status
substitute
suexec
unique_id
userdir
usertrack
version
vhost_alias



http://www.opennet.ru/opennews/art.shtml?num=31582

# Requirements

# Providers

    - skeleton

    /etc/httpd
    /etc/httpd/conf.d


    -config

      creates the base config

    mod_ssl

    - mod_php

    - performance


    - mpm

# Usage

# Attributes

  directories:

    conf

    conf.d

      This directory holds Apache 2.0 module-specific configuration files;
      any files in this directory which have the ".conf" extension will be
      processed as Apache configuration files.

Files are processed in alphabetical order, so if using configuration
directives which depend on, say, mod_perl being loaded, ensure that
these are placed in a filename later in the sort order than "perl.conf".


# Recipes

# Author

Author:: YOUR_NAME (<YOUR_EMAIL>)
