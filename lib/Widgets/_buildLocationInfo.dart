import 'dart:js';

import 'package:flutter/material.dart';
Widget buildLocationInfo({required context}) {
  return ListTile(
    title: Text(
      "Location",
      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
    ),
    subtitle: Row(
      children: [
        Text(
          "Aswan, Egypt",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
        ),
        const SizedBox(width: 5),
        const Icon(Icons.arrow_downward_rounded, color: Colors.white, size: 15),
      ],
    ),
  );
}