require './app'
require 'stackprof'

use StackProf::Middleware,
    enabled: ENV['ENABLE_STACKPROF'].to_i.nonzero?,
    mode: :cpu,
    interval: 1000,
    save_every: 5,
    out: 'tmp/stackprof.dump'

run App
