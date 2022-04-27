import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:student_id/all_export.dart';
import 'package:provider/provider.dart';
import 'package:student_id/components/walletConnect_c.dart';
import 'package:student_id/provider/api_provider.dart';
import 'package:student_id/provider/home_p.dart';
import 'package:student_id/provider/identifier_p.dart';
import 'package:student_id/provider/registration_p.dart';

import 'screens/test_screen_ui.dart';

void main() {
  // FlutterNativeSplash.removeAfter(initialization);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<IdentifierProvider>(
          create: (context) => IdentifierProvider(),
        ),
        ChangeNotifierProvider<ApiProvider>(
          create: (context) => ApiProvider(),
        ),
        ChangeNotifierProvider<RegistrationProvider>(
          create: (context) => RegistrationProvider(),
        ),
        ChangeNotifierProvider<WalletConnectComponent>(
          create: (context) => WalletConnectComponent(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
      ],
      child: const MyApp()
    )
  );
}

void initialization(BuildContext context) async {
  // This is where you can initialize the resources needed by your app while
  // the splash screen is displayed.
}

double paddingSize = 20;
class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  initState(){
    initApiProvider();
    WalletConnectComponent _wConnectC = WalletConnectComponent();
    _wConnectC.setBuildContext = context;
    super.initState();
  }
  
  initApiProvider() async {
    
    ApiProvider _apiProvider = Provider.of<ApiProvider>(context, listen: false);
    
    _apiProvider.initApi(context: context).then((value) async {
      if (_apiProvider.getKeyring.keyPairs.isNotEmpty) {
        await Provider.of<ApiProvider>(context, listen: false).getAddressIcon();
      }
      // await Provider.of<ApiProvider>(context, listen: false).getCurrentAccount();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student ID',
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor("#F3F3F3"),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
      home:  const LoginPage(),
      //LoginPage(),//CreateWalletPage(),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: loginRoute,
    );
  }
}
