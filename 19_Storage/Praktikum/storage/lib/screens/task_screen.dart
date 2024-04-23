import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:storage/components/profile.dart';
import 'package:storage/models/db_manager.dart';
import 'package:storage/screens/task_list_screen.dart';
import 'empty_task_screen.dart';
import 'task_item_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          'Contact',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (context) => const ProfileSheet(),
              );
            },
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TaskItemScreen(),
            ),
          );
        },
      ),
      body: buildTaskScreen(),
    );
  }

  Widget buildTaskScreen() {
    return Consumer<DbManager>(
      builder: (context, manager, child) {
        if (manager.taskModels.isNotEmpty) {
          return TaskListScreen(
            manager: manager,
          );
        } else {
          return const EmptyTaskScreen();
        }
      },
    );
  }
}
