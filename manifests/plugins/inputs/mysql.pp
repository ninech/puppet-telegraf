# == Class: telegraf::plugins::mysql
#
# this plugin adds the MySQL input plugin to telegraf
#
# === Parameters
#
# === Examples
#
#  include telegraf::plugins::mysql
#
# === Authors
#
# Roman Plessl <roman.plessl@prunux.ch>
#
# === Copyright
#
# Copyright 2015 Roman Plessl, Plessl + Burkhardt GmbH
#
class telegraf::plugins::inputs::mysql (
  # [mysql] section of telegraf.conf
  $host                          = '127.0.0.1',
  $port                          = 3306,
  $username                      = undef,
  $password                      = undef,
  $tls                           = false,
  $interval                      = undef,
  $interval_slow                 = '30m',
  $fieldpass                     = [],
  $databases                     = [],
)
{

  file { "${::telegraf::config_directory}/30-mysql.conf":
    ensure  => file,
    content => template('telegraf/plugins/30-mysql.conf.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'telegraf',
    notify  => Service['telegraf'];
  }

}
