import 'package:flutter_powerkit/flutter_powerkit.dart';

class UpdateDialogWidget extends StatelessWidget {
  const UpdateDialogWidget({
    super.key,
    required this.currentVersion,
    required this.newVersion,
    this.onUpdatePressed,
  });

  final String currentVersion;
  final String newVersion;
  final VoidCallback? onUpdatePressed;

  @override
  Widget build(BuildContext context) {
    Widget dialogTitle = Text(
      'Update Available',
      style: context.titleSmall,
    );

    Widget dialogContent = Text(
      'You can now update this app from $currentVersion to $newVersion and enjoy the latest features.',
      style: context.bodyLarge,
    );

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: AlertDialog(
        backgroundColor: context.scaffoldBackgroundColor,
        title: dialogTitle,
        content: dialogContent,
        actions: [
          TextButton(
            child: Text(
              'Later',
              style: context.titleSmall?.copyWith(
                color: Colors.red,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
              onPressed: onUpdatePressed ??
                  () async {
                    Navigator.pop(context);
                    if (Platform.isAndroid) {
                      await CommonHelper.launchPlaystore();
                    }
                  },
              child: Text(
                'Update',
                style: context.titleSmall?.copyWith(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }
}
