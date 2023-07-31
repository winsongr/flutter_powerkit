# Flutter PowerKit

This README describes the Flutter PowerKit package. If you publish this package to pub.dev,
this README's contents will appear on the landing page for your package.

## Description

Flutter PowerKit is your ultimate toolkit for supercharging your Flutter projects with essential utilities and functionalities. It simplifies your development process, allowing you to focus on creating exceptional apps without the hassle of repetitive tasks.

## Features

- **Splash Page:** Easily implement a stunning splash screen for a captivating app launch experience.
- **Package Info Management:** Access essential information about your app package, such as version, build number, and more.
- **Timezone Handling:** Seamlessly manage timezones for accurate date and time representation.
- **URL Launcher:** Open URLs, emails, and make phone calls with ease using simple-to-use methods.
- **Context Extensions:** Extend the capabilities of Flutter's context with helpful extensions for smoother development.

## Getting Started

To start using Flutter PowerKit, you'll need to have Flutter installed on your machine. If you haven't installed Flutter yet, refer to the [Flutter installation guide](https://flutter.dev/docs/get-started/install) for instructions.

Next, include the `flutter_powerkit` package in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_powerkit: ^latest_version
```

Run `flutter pub get` to fetch the dependencies, and you're all set to use Flutter PowerKit in your projects.

## Usage

Here's a simple example of how to use Flutter PowerKit to display a splash page:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_powerkit/flutter_powerkit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PowerKitSplashPage(
        duration: Duration(seconds: 2),
        image: AssetImage('assets/splash_image.png'),
        nextRoute: MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App Home'),
      ),
      body: Center(
        child: Text('Welcome to your app!'),
      ),
    );
  }
}
```

For more detailed examples and use cases, check the `/example` folder in the Flutter PowerKit package.

## Additional Information

For more information about Flutter PowerKit, including how to contribute, file issues, and find more examples, visit the [GitHub repository](https://github.com/winsongr/flutter_powerkit).

Happy coding with Flutter PowerKit!
