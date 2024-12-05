import 'package:flutter/material.dart';
import 'package:mtouch_lab_interview/src/features/notes/provider/note_provider.dart';
import 'package:mtouch_lab_interview/src/features/notes/screens/note_screen.dart';
import 'package:provider/provider.dart';

import 'src/features/notes/data/database/note_database.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.initDb();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => NoteProvider())
      ],
      child: MaterialApp(
        title: 'Interviw Assignment',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.blue,titleTextStyle: TextStyle(color: Colors.white)),
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const NotesScreen(),
      ),
    );
  }
}
