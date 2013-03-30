name "database"
description "Database configuration"
run_list("role[base]",
         "recipe[postgresql]",
         "recipe[postgresql::server]",
         "recipe[postgresql::setup]")

override_attributes(
                    :postgresql => {
                      :databag => "postgresql", # databag from which items are fetched
                      :clusters => [{
                          :name => "main",
                          :host => "0.0.0.0",
                          :version => "9.1",
                          :port => 5434,
                          :hba => [
                                   # { :method => 'ident', :address => '', :type => 'local', :user => "postgres"},
                                   { :method => 'md5', :address => '127.0.0.1/32' },
                                   { :method => 'md5', :address => '::1/128' }],
                          :password => {:postgres => "12345"},
                          :setup_items => ["gottwall"],
                          :extra_packages => ["postgresql-contrib-9.1",
                                              "postgresql-doc-9.1", "postgresql-plpython-9.1",
                                              "postgresql-server-dev-9.1"],
                          :config =>{
                                        "client_connection" => {
                                          "lc_messages" => "ru_RU.UTF-8",
                                          "lc_monetary" => "ru_RU.UTF-8",
                                          "lc_numeric" => "ru_RU.UTF-8"
                                        }}
                        }
                      ]
  }
)
