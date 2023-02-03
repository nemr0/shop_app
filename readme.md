# shop_app

A new Flutter project with Serverpod + Hooks + BLoC + Rive.

## How To Run The Example

### Serverpod (shop_app_server)

Create your `passwords.yaml` in
`/shop_app_server/config` with the following:

```
shared:

mySharedPassword: 'my password'

development:

database: 'databasePasswordExample'
redis: 'redisPasswordExample'
gmail: 'example@gmail.com'
gpass: 'aGmailAppPassword'
serviceSecret: 'aServiceSecretExample'

staging:

database: 'databasePasswordExample'
serviceSecret: 'aServiceSecretExample'

production:
database: 'databasePasswordExample'
serviceSecret: 'aServiceSecretExample'
```
To run your server, you first need to start Postgres and Redis. It's easiest to do with Docker.

    docker-compose up --build --detach

Then you can start the Serverpod server.

    dart bin/main.dart

When you are finished, you can shut down Serverpod with `Ctrl-C`, then stop Postgres and Redis.

    docker-compose stop

### Flutter (shop_app_flutter)

To run the project, first make sure that the server is running, then do:

    flutter run


### Thanks to The Creators and Contributors of:


- [Serverpod](https://docs.serverpod.dev).
- [Flutter Hooks](https://pub.dev/documentation/flutter_hooks/latest/)
- [Rive](https://help.rive.app/runtimes/overview/flutter)
- [BLoC](https://bloclibrary.dev)
- Also, flutter itself <3