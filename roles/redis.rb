name "redis"
description "Redis configuration"
run_list "role[base]", "recipe[redis::user]", "recipe[redis::instance]"
override_attributes "redis" => {"provider" => "redis_runit", "servers" => [{"bind" => "127.0.0.1", "port" => 6379}]}
