import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:serverpod/serverpod.dart';

import 'package:shop_app_server/src/web/routes/root.dart';
import 'package:serverpod_auth_server/module.dart' as auth;
import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );
  final eGmail = Serverpod.instance?.getPassword('gmail') ?? '';
  print(eGmail);
  final smtpServer =
      gmail(eGmail, Serverpod.instance?.getPassword('gpass') ?? '');
  Message createMsg(
      bool isValidateOrPassReset, String email, String validationCode) {
    Message msg = Message()
      ..from = Address(eGmail, 'Shop App')
      ..recipients.add(email)
      ..subject =
          isValidateOrPassReset ? 'Verify Email Address' : 'Password Reset'
      ..html =
          "This is your Validation Code : <strong>$validationCode</strong>";
    return msg;
  }

  auth.AuthConfig.set(auth.AuthConfig(
    sendValidationEmail: (session, email, validationCode) async {
      try {
        await send(createMsg(true, email, validationCode), smtpServer);
      } catch (e) {
        return false;
      }
      return true;
    },
    sendPasswordResetEmail: (session, userInfo, validationCode) async {
      try {
        await send(
            createMsg(true, userInfo.email ?? '', validationCode), smtpServer);
      } catch (e) {
        return false;
      }
      return true;
    },
  ));
  // Start the server.
  await pod.start();
}
