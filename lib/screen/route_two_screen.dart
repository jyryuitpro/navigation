import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(
      title: 'Route Two',
      children: [
        Text(
          'arguments: ${arguments}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Pop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/three',
              arguments: 999,
            );
          },
          child: Text('Push Named'),
        ),
        ElevatedButton(
          onPressed: () {
            // [HomeScreen(), RouteOneScreen(), RouteTwoScreen(): RouteThreeScreen()로 대체됨, RouteThreeScreen()]
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //   builder: (_) => RouteThreeScreen(),
            // ));

            // [HomeScreen(), RouteOneScreen(), RouteTwoScreen(): RouteThreeScreen()로 대체됨, RouteThreeScreen()]
            Navigator.of(context).pushReplacementNamed(
              '/three',
            );
          },
          child: Text('Push Replacement'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => RouteThreeScreen(),
              ),
              // (route) => false,
              // false이면 Route Stack에서 제거됨
              (route) => route.settings.name == '/',
            );
          },
          child: Text('Push And Remove Until'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/three',
              // (route) => false,
              // false이면 Route Stack에서 제거됨
              (route) => route.settings.name == '/',
            );
          },
          child: Text('Push Named And Remove Until'),
        ),
      ],
    );
  }
}
