import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mtouch_lab_interview/src/features/notes/data/database/note_database.dart';

import '../data/model/note_model.dart';

class NoteProvider extends ChangeNotifier {
  

  List<NoteModel> _notesList = [];
  List<NoteModel> get noteList => _notesList;


  List<NoteModel> _workList = [];
  List<NoteModel> get  workList => _workList;

    List<NoteModel> _professionalList = [];
  List<NoteModel> get  professionalList  => _professionalList;

    List<NoteModel> _shoppingList = [];
  List<NoteModel> get  shoppingList => _shoppingList;



  bool _isLoading = false;
  bool get isLoading => _isLoading;




  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }


  Future<void> addNote({required NoteModel noteModel,required VoidCallback callback}) async {
    setLoading(true);
    await Future.delayed(const Duration(milliseconds: 800));
   int value =  await DatabaseHelper.instance.inserNote(noteModel);
    if(value != 0) {
    setLoading(false);
    getAllNotesList();
    callback();

      Fluttertoast.showToast(msg: "Note inserted",backgroundColor: Colors.green,textColor: Colors.white);
  _selectedCategory = null;
    }else {
    setLoading(false);

      Fluttertoast.showToast(msg: "something went wrong",backgroundColor: Colors.red,textColor: Colors.white);

    }
    setLoading(false);

    notifyListeners();
    
  }

   final List<String> _categoriesList = const[
    "Work",
    "Professional",
    "Shopping",
  ];

  List<String>  get categoriesList =>_categoriesList;


  String? _selectedCategory = null;
  String? get selectedCategory => _selectedCategory;
  void setSelectedCategory(String? value) {
    _selectedCategory = value;
    notifyListeners();

  }

  void reseStates() {
    _selectedCategory = null;
    notifyListeners();
  }


  Future<void> getAllNotesList() async {
    setLoading(true);
    List<Map<String,dynamic>> list = await DatabaseHelper.instance.getAllNotes();

    if(list.isNotEmpty) {

      for(Map data in list) {
        NoteModel noteModel  = NoteModel(title: data['title'], category: data['category'], dateTime: data['dateTime']);
        _notesList.add(noteModel);
      }

      _workList = _notesList.where((e) => e.category.toLowerCase().toString() == "work").toList();
      _professionalList = _notesList.where((e) => e.category.toLowerCase().toString() == "professional").toList();
      _shoppingList = _notesList.where((e) => e.category.toLowerCase().toString() == "shopping").toList();
      notifyListeners();
       setLoading(false);


      

    }else {
      _notesList =[];
      notifyListeners();
      setLoading(false);
    }

    setLoading(false);
  }




}