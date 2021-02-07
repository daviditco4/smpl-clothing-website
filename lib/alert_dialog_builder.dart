import 'package:flutter/material.dart';

Widget buildNotImplFeatureDialog(BuildContext context, String featureName) {
  final navigator = Navigator.of(context);

  return AlertDialog(
    title: Text(featureName + ' no disponible'),
    content: const Text('Esta opción aún está en desarrollo.'),
    actions: [
      SimpleDialogOption(onPressed: navigator.pop, child: const Text('OKAY')),
    ],
  );
}
