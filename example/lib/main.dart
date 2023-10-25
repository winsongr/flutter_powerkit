import 'package:example/home/home_page.dart';
import 'package:flutter_powerkit/flutter_powerkit.dart';
// import 'package:flutter_powerkit/flutter_powerkit.dart';

void main() async {
  await UtilityHelper.instance.initiate();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FlutterPowerKitSplash(
      onNavigationComplete: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
    ));
  }
}
