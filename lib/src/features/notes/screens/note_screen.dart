import 'package:flutter/material.dart';
import 'package:mtouch_lab_interview/main.dart';
import 'package:mtouch_lab_interview/src/features/notes/provider/note_provider.dart';
import 'package:mtouch_lab_interview/src/features/notes/screens/add_note_screen.dart';
import 'package:mtouch_lab_interview/src/features/notes/screens/widgets/professional_list_widget.dart';
import 'package:mtouch_lab_interview/src/features/notes/screens/widgets/shopping_lis_widget.dart';
import 'package:mtouch_lab_interview/src/features/notes/screens/widgets/work_list_widget.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatefulWidget  {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((c) async{
      context.read<NoteProvider>().getAllNotesList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) => AddNoteScreen()));
        },child: Icon(Icons.add),),
        appBar: AppBar(
          title: Text("View Notes"),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
            Tab(
              child: Text("Work"),
            ),
            Tab(
              child: Text("Professional"),
            ),
            Tab(
              child: Text("Shopping"),
            ),
          ]),
        ),
        
        body: SafeArea(child: 
        TabBarView(children: [
         WorkListWidget(),
          ProfessionalListWidget(),
          ShoppingListWidget(),
        ])
        ),
      ),
    );
  }
}