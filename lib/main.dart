import 'package:demoflutterapp/photo_express_page.dart';
import 'package:demoflutterapp/pickup_person_page.dart';
import 'package:flutter/material.dart';

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
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DemoFlutter App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ElevatedButton(
              onPressed: () async {
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => PickupPersonPage(
                          name: 'John wick',
                          email: 'john@email.com',
                          number: '1234567890',
                        ),
                  ),
                );
                print('result === $result');
              },
              child: Text('Pickup person page'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => PhotoExpressPage(
                          imgList: [
                            'https://picsum.photos/id/237/200/300',
                            'https://picsum.photos/200/300',
                            'https://picsum.photos/id/237/200/300',
                            'https://picsum.photos/200/300',
                            'https://picsum.photos/id/237/200/300',
                            'https://picsum.photos/200/300',
                            'https://picsum.photos/id/237/200/300',
                            'https://picsum.photos/200/300',
                            'https://picsum.photos/id/237/200/300',
                          ],
                        ),
                  ),
                );
              },
              child: Text('CVS photo express page'),
            ),
          ],
        ),
      ),
    );
  }
}
