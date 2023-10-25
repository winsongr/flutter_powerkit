import 'package:flutter_powerkit/flutter_powerkit.dart';

class FlutterPowerKitSplash extends StatelessWidget {
  final String? imageAsset;
  final String? version;
  final String? appName;
  final int duration;
  final VoidCallback? onNavigationComplete;
  final Color? color;

  const FlutterPowerKitSplash({
    super.key,
    this.imageAsset,
    this.version,
    this.duration = 2000, // Default duration in milliseconds (2 seconds)
    this.onNavigationComplete,
    this.appName,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: duration), () {
      if (onNavigationComplete != null) onNavigationComplete!();
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageAsset != null) Image.asset(imageAsset!) else Container(),
            const SizedBox(height: 20),
            Text(
              appName ?? '',
              style: context.headlineSmall?.copyWith(
                color: color,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: context.height * 0.01),
            Text(
              'Version ${UtilityHelper.instance.appVersion}',
              style: context.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
