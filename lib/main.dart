import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_app.dart';
import 'providers/motel_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MotelProvider(),
      child: const MyApp(),
    ),
  );
}
