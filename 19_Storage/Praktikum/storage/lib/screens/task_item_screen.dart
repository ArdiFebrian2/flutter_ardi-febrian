import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:storage/models/db_manager.dart';
import 'package:storage/models/task_model.dart';
import 'package:provider/provider.dart';

class TaskItemScreen extends StatefulWidget {
  final TaskModel? taskModel;
  const TaskItemScreen({
    Key? key,
    this.taskModel,
  }) : super(key: key);

  @override
  _TaskItemScreenState createState() => _TaskItemScreenState();
}

class _TaskItemScreenState extends State<TaskItemScreen> {
  final _taskNameController = TextEditingController();
  bool _isUpdate = false;
  @override
  void initState() {
    super.initState();
    if (widget.taskModel != null) {
      _taskNameController.text = widget.taskModel!.taskName;
      _isUpdate = true;
    }
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: Text('Create Contact', style: GoogleFonts.poppins()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            buildNameField(),
            const SizedBox(
              height: 16,
            ),
            buildButton(),
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Title',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: _taskNameController,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            hintText: 'isi contact yu',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildButton() {
    return ElevatedButton(
      child: Text(
        'Create Contact',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
      onPressed: () {
        if (!_isUpdate) {
          final task = TaskModel(taskName: _taskNameController.text);
          Provider.of<DbManager>(context, listen: false).addTask(task);
        } else {
          final task = TaskModel(
            id: widget.taskModel!.id,
            taskName: _taskNameController.text,
          );
          Provider.of<DbManager>(context, listen: false).updateTask(task);
        }
        Navigator.pop(context);
      },
    );
  }
}
