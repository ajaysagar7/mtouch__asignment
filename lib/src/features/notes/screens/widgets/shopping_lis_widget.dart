import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mtouch_lab_interview/src/features/notes/data/model/note_model.dart';
import 'package:mtouch_lab_interview/src/features/notes/provider/note_provider.dart';
import 'package:provider/provider.dart';


class ShoppingListWidget extends StatelessWidget {
  const ShoppingListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(
      builder: (context,provider,_) {
        return provider.isLoading ? Center(child: CircularProgressIndicator(),) : provider.shoppingList.isEmpty ? Center(child: Text("No notes found for Shopping category :<"),) : ListView.separated(
          shrinkWrap: true,
          itemBuilder: (c,i) {
          NoteModel noteModel = provider.shoppingList[i];
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              color: Colors.white,
              child: ListTile(
              
                title: Text(noteModel.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( "category: " +noteModel.category.toString(),style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 5,),
                    Text("Created on: "+ DateFormat.yMMMEd().format(DateTime.parse(noteModel.dateTime.toString())))
                  ],
                ),
              ),
            ),
          );
        },itemCount: provider.shoppingList.length, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 10,); },);
      }
    );
  }
}