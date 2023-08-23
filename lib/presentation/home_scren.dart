import 'package:alpha_test/domain/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FilledButton(
                onPressed: () {
                  GoRouter.of(context).push(scaner_route);
                },
                child: Text("INICIAR ESCANEO")),
            SizedBox(
              height: 40,
            ),
            FilledButton(
                onPressed: () {
                  GoRouter.of(context).push(historico_route);
                },
                child: Text("HISTÓRICO")),
          ],
        ),
      ),
    );
  }
}
