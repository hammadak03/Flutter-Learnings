import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_app/handlers/db_handler.dart';
import 'package:todo_list_app/models/todo_model.dart';
import 'package:todo_list_app/screens/home_screen.dart';

// ignore: must_be_immutable
class AddUpdateScreen extends StatefulWidget {
  int? todoId;
  String? todoTitle;
  String? todoDesc;
  String? todoDT;
  bool? update;

  AddUpdateScreen(
      {this.todoId, this.todoTitle, this.todoDesc, this.todoDT, this.update});

  @override
  State<AddUpdateScreen> createState() => _AddUpdateScreenState();
}

class _AddUpdateScreenState extends State<AddUpdateScreen> {
  DBHelper? dbHelper;
  late Future<List<TodoModel>> dataList;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData() async {
    dataList = dbHelper!.getDataList();
  }

  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController(text: widget.todoTitle);
    final _descController = TextEditingController(text: widget.todoDesc);
    String appTitle;
    if (widget.update == true) {
      appTitle = 'Update TODO';
    } else {
      appTitle = 'Add TODO';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appTitle,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 1),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        controller: _titleController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Note Title'),
                        validator: (value) {
                          if (value!.isEmpty) return 'Enter some text';
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        minLines: 5,
                        controller: _descController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Write notes here'),
                        validator: (value) {
                          if (value!.isEmpty) return 'Enter some text';
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            if (widget.update == true) {
                              dbHelper!.update(
                                TodoModel(
                                    id: widget.todoId,
                                    title: _titleController.text,
                                    desc: _descController.text,
                                    dateandtime: widget.todoDT),
                              );
                            } else {
                              dbHelper!.insert(
                                TodoModel(
                                  title: _titleController.text,
                                  desc: _descController.text,
                                  dateandtime: DateFormat('yMd')
                                      .add_jm()
                                      .format(DateTime.now())
                                      .toString(),
                                ),
                              );
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                            _titleController.clear();
                            _descController.clear();
                            print('Date added');
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 55,
                          width: 120,
                          decoration: BoxDecoration(
                              // boxShadow: [
                              //   BoxShadow(
                              //       color: Colors.black12,
                              //       blurRadius: 7,
                              //       spreadRadius: 1),
                              // ],
                              ),
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _titleController.clear();
                            _descController.clear();
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 55,
                          width: 120,
                          decoration: BoxDecoration(
                              // boxShadow: [
                              //   BoxShadow(
                              //       color: Colors.black12,
                              //       blurRadius: 7,
                              //       spreadRadius: 1),
                              // ],
                              ),
                          child: Text(
                            'Clear',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
