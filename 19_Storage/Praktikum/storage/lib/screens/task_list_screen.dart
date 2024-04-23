import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage/components/task_item_card.dart';
import 'package:storage/models/db_manager.dart';
import 'package:storage/screens/task_item_screen.dart';

class TaskListScreen extends StatelessWidget {
  final DbManager manager;
  const TaskListScreen({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<DbManager>(
          builder: (context, manager, child) {
            final taskItems = manager.taskModels;
            return ListView.separated(
              itemCount: taskItems.length,
              itemBuilder: (context, index) {
                final item = taskItems[index];
                return InkWell(
                  onTap: () async {
                    final selectedTask = await manager.getTaskById(item.id!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskItemScreen(
                          taskModel: selectedTask,
                        ),
                      ),
                    );
                  },
                  child: TaskItemCard(
                    task: item,
                    onPressed: () {
                      manager.deleteTask(item.id!);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${item.taskName} Deleted')),
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
            );
          },
        ));
  }
}
