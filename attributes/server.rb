# handlers
default['sensu-wrapper']['server']['handlers'] = []

# mailer notification
default['sensu-wrapper']['server']['mailer'] = false
default['sensu-wrapper']['server']['mailer_script'] = 'https://raw.githubusercontent.com/sensu/sensu-community-plugins/master/handlers/notification/mailer.rb'
default['sensu-wrapper']['server']['mailer_handler'] = {}

# checks
default['sensu-wrapper']['server']['default_checks'] = [
  {
    :name => 'check-load',
    :command => '/etc/sensu/plugins/check-load.rb',
    :subscribers => [ 'all' ],
    :interval => 60,
    :handlers => [ 'default', 'mailer' ],
    :additional => {
      :occurrences => 5,
      :refresh => 180
    }
  },
  {
    :name => 'check-disk',
    :command => '/etc/sensu/plugins/check-disk.rb -w 70 -c 90',
    :subscribers => [ 'all' ],
    :interval => 60,
    :handlers => [ 'default', 'mailer' ],
    :additional => {
      :occurrences => 5,
      :refresh => 180
    }
  },
  {
    :name => 'check-cpu',
    :command => '/etc/sensu/plugins/check-cpu.rb -w 70 -c 90',
    :subscribers => [ 'all' ],
    :interval => 60,
    :handlers => [ 'default', 'mailer' ],
    :additional => {
      :occurrences => 5,
      :refresh => 180
    }
  },
  {
    :name => 'check-ram',
    :command => '/etc/sensu/plugins/check-ram.rb -w 10 -c 5',
    :subscribers => [ 'all' ],
    :interval => 60,
    :handlers => [ 'default', 'mailer' ],
    :additional => {
      :occurrences => 5,
      :refresh => 180
    }
  }
]
default['sensu-wrapper']['server']['extension_checks'] = []
