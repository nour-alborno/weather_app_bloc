import 'package:flutter/material.dart';

Center failure_widget() {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'there is no weather 😔 start',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Text(
          'searching now 🔍',
          style: TextStyle(
            fontSize: 30,
          ),
        )
      ],
    ),
  );
}