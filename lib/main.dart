import 'package:flutter/material.dart';
import 'package:musicapp/musiclist.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: const Musiclist(),
    theme: ThemeData(useMaterial3: true),
  ));
}
