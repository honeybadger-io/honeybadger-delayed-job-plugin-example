# Notify Honeybadger of errors in DelayedJob workers
# in /config/initializers/
# http://stackoverflow.com/a/14172132/1332687, https://gist.github.com/2223758
# modified

module Delayed
  module Plugins
    class Honeybadger < Plugin
      module Notify
        def error(job, error)
          ::Honeybadger.notify(
            :error_class   => error.class.name,
            :error_message => "#{error.class.name}: #{error.message}",
            :parameters    => {
              :failed_job => job.inspect,
            }
          )
          super if defined?(super)
        end
      end

      callbacks do |lifecycle|
        lifecycle.before(:invoke_job) do |job|
          payload = job.payload_object
          payload = payload.object if payload.is_a? Delayed::PerformableMethod
          payload.extend Notify
        end
      end
    end
  end
end

Delayed::Worker.plugins << Delayed::Plugins::Honeybadger
