import'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
    Text('there is no wather 😔 start',
    style: TextStyle(
      fontSize: 25,
    ),),
    Text('searching now 🔍',
    style: TextStyle(
      fontSize: 25,
    ),),
          ],
        ),
      );
  }
}