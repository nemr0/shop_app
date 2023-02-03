import 'package:bloc/bloc.dart';
import 'package:serverpod_auth_apple_flutter/serverpod_auth_apple_flutter.dart';
import 'package:shop_app_client/shop_app_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:shop_app_flutter/UI/screens/login_screen.dart';
import 'package:shop_app_flutter/config/theme/light.dart';

import 'bloc/custom_bloc_observer.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client(
  'http://localhost:8080/',
  authenticationKeyManager: FlutterAuthenticationKeyManager(),
)..connectivityMonitor = FlutterConnectivityMonitor();

Future<void> main() async {
  // Need to call this as we are using Flutter bindings before runApp is called.
  WidgetsFlutterBinding.ensureInitialized();

  // The session manager keeps track of the signed-in state of the user. You
  // can query it to see if the user is currently signed in and get information
  // about the user.
  var sessionManager = SessionManager(
    caller: client.modules.auth,
  );
  await sessionManager.initialize();
  Bloc.observer = CustomBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop',
      theme: lightTheme(),
      home: const LoginScreen(),
    );
  }
}
