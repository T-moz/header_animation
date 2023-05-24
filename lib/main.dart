import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        cupertinoOverrideTheme: const CupertinoThemeData(),
      ),
      home: const Page(index: 0),
    );
  }
}

class Page extends StatelessWidget {
  const Page({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      topRadius: const Radius.circular(16),
      body: Builder(builder: (cupertinoScaffoldContext) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                backgroundColor: Colors.white,
                largeTitle: Text('Page : $index'),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(cupertinoScaffoldContext).push(
                            MaterialPageRoute(
                              builder: (context) => Page(index: index + 1),
                            ),
                          );
                        },
                        child: const Text('Open page'),
                      ),
                      const SizedBox.square(dimension: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          CupertinoScaffold.showCupertinoModalBottomSheet(
                            context: cupertinoScaffoldContext,
                            expand: true,
                            builder: (context) => const SizedBox.shrink(),
                            useRootNavigator: true,
                          );
                        },
                        child: const Text('Show modale'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
