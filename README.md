<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This package is a clone of the famous [react-toastify](https://fkhadra.github.io/react-toastify/introduction/) library.

Motivations: At the time of writing this, the existing packages for toast offer minimal options, and your only fallback are banners and the snack bar from the material team. I wanted to provide an alternative to the existing solutions and porting React-Toastify to Flutter was on my to-do list.

This package is in development\*, and might not be used in production until the first stable release is announced.

Just so you know, I'm currently employed full time and this project might take some time to see the light.

https://github.com/Flutter-Factories/flutter-toastify/assets/2213079/51b12114-027f-4b9b-a0f4-051421bb0587



## Features

- [x] toast overlay
- [x] show, dispose
- [x] timer and progress indicator.
- [ ] customizations
- [ ] interactions
- [ ] editing
- [ ] async toasts
- [ ] animations
- [ ] tests

- [ ] online demo

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ToastOverlay(
        child: MyHomePage(title: 'Flutter Toastify Demo'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _newToast() {
    ToastManager.instance.add(ToastController(title: '🦄 Wow so easy !'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            ElevatedButton(
              onPressed: _newToast,
              child: const Text('New Toast'),
            ),
          ],
        )),
      ),
    );
  }
}

```

## Additional information

### Contributions

If you're interested in development, Pick any missing features get to know how react-toastify works and open a pull request!
Or you can simply test the package and participate in development discussions

TODO: Tell users more about the package: where to find more information, how to file issues, what response they can expect
from the package authors, and more.
