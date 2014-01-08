# Honeybadger/DelayedJob Example App

This is an example Rails application which uses
[DelayedJob](https://github.com/collectiveidea/delayed_job) to report
exceptions to the [Honeybadger Rails Exception
Tracker](https://www.honeybadger.io/).

## Testing a failed job w/ notification:

1. Setup the sqlite database:

    ```sh
    bundle exec rake db:setup
    ```

2. Start the worker:

    ```sh
    HONEYBADGER_API_KEY=your-api-key bundle exec rake jobs:work
    ```

3. Start the console:

   ```sh
   HONEYBADGER_API_KEY=your-api-key bundle exec rails console
   ```

4. From the console, fire off the failing job:

    ```ruby
    Post.delay.failing_method
    ```

Please note that in order for notifications to be delivered in the Rails
development environment, we've made some special changes to [the
honeybadger initializer](./config/initializers/honeybadger.rb).
