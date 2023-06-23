import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:little_happyfish/api/youtube_apis/video_notifier.dart';
import 'package:little_happyfish/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    //  options: const FirebaseOptions(
    //  options: DefaultFirebaseOptions.android,
    // apiKey: "api key here",
    // appId: "app id here",
    // messagingSenderId: "messaging id",
    // projectId: "project id here",
  );

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => VideoNotifier())],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<VideoNotifier>(context, listen: false);
    });
  }

  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'HappyFish Demo',
      debugShowCheckedModeBanner: false,
      home: auth_page(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const auth_page(),
      //   '/item 1': (context) => const UserHome(),
      //   '/item 2': (context) => EnglishQuiz(),
      //   // '/item 3': (context) => Item3Page(),
      //   // '/item 4': (context) => Item4Page(),
      // },
    );
  }
}
