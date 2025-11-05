import '../models/data_layer.dart';
import 'package:flutter/material.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          // ambil plan terbaru dari list
          final currentPlan = plans.firstWhere(
            (p) => p.name == widget.plan.name,
          );

          return Column(
            children: [
              Expanded(child: _buildList(currentPlan, plansNotifier)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context, plansNotifier),
    );
  }

  Widget _buildAddTaskButton(
    BuildContext context,
    ValueNotifier<List<Plan>> plansNotifier,
  ) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        final plans = List<Plan>.from(plansNotifier.value);
        final index = plans.indexWhere((p) => p.name == widget.plan.name);
        if (index == -1) return;

        final updatedPlan = Plan(
          name: plans[index].name,
          tasks: List<Task>.from(plans[index].tasks)..add(const Task()),
        );

        plans[index] = updatedPlan;
        plansNotifier.value = plans; // trigger rebuild
      },
    );
  }

  Widget _buildList(Plan plan, ValueNotifier<List<Plan>> plansNotifier) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan, index, plansNotifier),
    );
  }

  Widget _buildTaskTile(
    Plan plan,
    int index,
    ValueNotifier<List<Plan>> plansNotifier,
  ) {
    final task = plan.tasks[index];

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          final plans = List<Plan>.from(plansNotifier.value);
          final planIndex = plans.indexWhere((p) => p.name == plan.name);
          if (planIndex == -1) return;

          final updatedTasks = List<Task>.from(plan.tasks)
            ..[index] = Task(
              description: task.description,
              complete: selected ?? false,
            );

          plans[planIndex] = Plan(name: plan.name, tasks: updatedTasks);
          plansNotifier.value = plans;
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          final plans = List<Plan>.from(plansNotifier.value);
          final planIndex = plans.indexWhere((p) => p.name == plan.name);
          if (planIndex == -1) return;

          final updatedTasks = List<Task>.from(plan.tasks)
            ..[index] = Task(description: text, complete: task.complete);

          plans[planIndex] = Plan(name: plan.name, tasks: updatedTasks);
          plansNotifier.value = plans;
        },
      ),
    );
  }
}
