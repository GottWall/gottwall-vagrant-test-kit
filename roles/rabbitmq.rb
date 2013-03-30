name "service"
description "Additional services as queue, ampq"
run_list "role[base]", "recipe[erlang]", "recipe[rabbitmq]","recipe[rabbitmq::plugin_management]", "recipe[rabbitmq::user_management]"

default_attributes 'rabbitmq' => {
  'enabled_plugins' => ['rabbitmq_management'],
  'default_pass' => "12345",
  'default_user' => "rabbitadmin",
  'enabled_users' => [{ :name => "gottwall", :password => "12345", :tag => "administrator", :rights =>
                        [{:vhost => nil , :conf => ".*", :write => ".*", :read => ".*"}]
                      }]
}



