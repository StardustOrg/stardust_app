import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/common/widgets/artist_cont.dart';
import 'package:stardust_app_skeleton/common/widgets/photocard_cont.dart';
import 'package:stardust_app_skeleton/common/widgets/store_cont.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';
import 'package:stardust_app_skeleton/utils/theme/theme.dart';

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
      themeMode: ThemeMode.system,
      theme: StarTheme.lightTheme,
      darkTheme: StarTheme.darkTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ArtistContainer(artistName: 'ENHYPEN'),
            StoreContainer(
              storeName: 'Lojinha 12',
            ),
            PhotocardContainer(
              artistName: "(G)-IDLE",
              pcName: "OT5 Photocard",
              price: 6.66,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: StarSizes.lg,
                  ),
                  PhotocardContainer(
                    artistName: "(G)-IDLE",
                    pcName: "OT5 Photocard",
                    price: 6.66,
                  ),
                  SizedBox(
                    width: StarSizes.md,
                  ),
                  PhotocardContainer(
                    artistName: "(G)-IDLE",
                    pcName: "OT5 Photocard",
                    price: 6.66,
                  ),
                  SizedBox(
                    width: StarSizes.md,
                  ),
                  PhotocardContainer(
                    artistName: "(G)-IDLE",
                    pcName: "OT5 Photocard",
                    price: 6.66,
                  ),
                  SizedBox(
                    width: StarSizes.md,
                  ),
                  PhotocardContainer(
                    artistName: "(G)-IDLE",
                    pcName: "OT5 Photocard",
                    price: 6.66,
                  ),
                  SizedBox(
                    width: StarSizes.md,
                  ),
                  PhotocardContainer(
                    artistName: "(G)-IDLE",
                    pcName: "OT5 Photocard",
                    price: 6.66,
                  ),
                  SizedBox(
                    width: StarSizes.md,
                  ),
                  PhotocardContainer(
                    artistName: "(G)-IDLE",
                    pcName: "OT5 Photocard",
                    price: 6.66,
                  ),
                  SizedBox(
                    width: StarSizes.md,
                  ),
                  PhotocardContainer(
                    artistName: "(G)-IDLE",
                    pcName: "OT5 Photocard",
                    price: 6.66,
                  ),
                  SizedBox(
                    width: StarSizes.lg,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
