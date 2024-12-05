import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mtouch_lab_interview/main.dart';
import 'package:mtouch_lab_interview/src/common/common_button.dart';
import 'package:mtouch_lab_interview/src/common/common_textfield.dart';
import 'package:mtouch_lab_interview/src/features/notes/data/model/note_model.dart';
import 'package:provider/provider.dart';

import '../provider/note_provider.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {

  final _titleController = TextEditingController();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((c) {
      context.read<NoteProvider>().reseStates();
    });
  }


  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
      ),
      body: SafeArea(child: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: context.watch<NoteProvider>().isLoading == true ? const Center(child: CircularProgressIndicator(),) : Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          const Text("Add Title"),
          const SizedBox(height: 10,),
          CommonTextField(textEditingController: _titleController, hintTitle: 'Enter your title here'),
          const SizedBox(height: 20,),
            const Text("Choose Cateogory"),
          const SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100
            ),
            child: DropdownButton<String>(
              hint: const Text("please select category"),
              borderRadius: BorderRadius.circular(8),
              isExpanded: true,
              value: context.watch<NoteProvider>().selectedCategory,
              items: context.watch<NoteProvider>().categoriesList.map((e) => DropdownMenuItem(child: Text(e),value: e,)).toList(), onChanged: (String? value) {
              context.read<NoteProvider>().setSelectedCategory(value);
            }),
          ),
            const SizedBox(height: 30,),
            Center(
              child: CommonButton(title: "Add Note", callback: () {
                if(_titleController.text.isNotEmpty && context.read<NoteProvider>().selectedCategory != null) {
                  
                  NoteModel noteModel = NoteModel(title: _titleController.text.trim(), category: context.read<NoteProvider>().selectedCategory!.toLowerCase().toString(), dateTime: DateTime.now().toString());
          if(context.mounted) {
                  context.read<NoteProvider>().addNote(noteModel: noteModel, callback: () { 
                    _titleController.clear();
                    if(context.mounted) {
                      Navigator.pop(context);
                    }
                   });

          }
                    }else {
                Fluttertoast.showToast(msg: 'Please fill all the fields',backgroundColor: Colors.red,textColor: Colors.white);

                }
              }),
            ),

            // ignore: prefer_const_constructors
            // SizedBox(height: 20,),
            // CommonButton(title: "Get All Notes", callback: () async{
            //   await context.read<NoteProvider>().getAllNotesList();
            // }),
        
        ],),
      ),)),
    );
  }
}