import 'package:event_task/logic/event_bloc/event_bloc.dart';
import 'package:event_task/presentation/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constants/app_colors.dart';
import '../../data/constants/app_navigator.dart';
import '../../data/constants/app_utils.dart';
import '../../data/models/todo_model.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_drop_down.dart';
import 'widgets/custom_text_field.dart';

class AddEventPage extends StatefulWidget {
  final TodoModel? todo;
  const AddEventPage({
    this.todo,
    super.key,
  });

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  late final TextEditingController locationController;
  late final TextEditingController timeController;
  final colorIndex = ValueNotifier(0);

  @override
  void initState() {
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    locationController = TextEditingController();
    timeController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (widget.todo != null) {
      nameController.text = widget.todo!.eventName;
      descriptionController.text = widget.todo!.eventDescription;
      locationController.text = widget.todo!.eventLocation;
      timeController.text = widget.todo!.time;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    timeController.dispose();
    super.dispose();
  }

  String? validateName(String? value) {
    if (value != null && value.isEmpty) {
      return "Event name is empty";
    }
    return null;
  }

  String? validateTime(String? value) {
    final regex = RegExp(r"([0-9]{2}):([0-9]{2})-([0-9]{2}):([0-9]{2})");
    if (!(value != null && regex.hasMatch(value))) {
      return "It is not correct time";
    }
    return null;
  }

  void addEvent() {
    if (formKey.currentState!.validate()) {
      final todo = TodoModel(
        id: 01,
        eventName: nameController.text,
        eventDescription: descriptionController.text,
        eventLocation: locationController.text,
        priorityColor: colorIndex.value,
        time: timeController.text,
        remainder: 15,
        taskDate: context.read<EventBloc>().state.eventTodo.current,
      );
      if (widget.todo == null) {
        context.read<EventBloc>().add(CreateTodo(todo));
        context.read<EventBloc>().add(const LoadingEvent());
        AppNavigator.navigatorPop(context);
      } else {
        context.read<EventBloc>().add(
              UpdateTodo(
                id: widget.todo!.id,
                todo: todo,
              ),
            );
        context.read<EventBloc>().add(const LoadingEvent());
        AppNavigator.navigatorPushReplacement(context, const MainPage());
      }
    }
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: CustomAppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppUtils.pTop8Sym8,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const _Texts(text: "Event Name"),
                const SizedBox(height: 5),
                CustomTextField(
                  hint: "Enter Your Event Name",
                  controller: nameController,
                  validator: validateName,
                ),
                const SizedBox(height: 5),
                const _Texts(text: "Event description"),
                const SizedBox(height: 5),
                CustomTextField(
                  hint: "Enter Description For Your Event",
                  controller: descriptionController,
                  maxLines: 6,
                ),
                const _Texts(text: "Event Location"),
                const SizedBox(height: 5),
                CustomTextField(
                  hint: "Enter Event Location",
                  controller: locationController,
                  suffix: const Icon(
                    Icons.location_on,
                    color: AppColors.blueColor,
                  ),
                ),
                const _Texts(text: "Primary Color"),
                const SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomDropDownButton(
                      colorIndex: colorIndex,
                    ),
                  ],
                ),
                const _Texts(text: "Event time"),
                CustomTextField(
                  hint: "xx:yy-xx:yy",
                  controller: timeController,
                  validator: validateTime,
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: AppUtils.pAll15,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: AppColors.blueColor,
                      backgroundColor: AppColors.blueColor,
                      fixedSize: const Size(double.infinity, 50),
                    ),
                    onPressed: addEvent,
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Texts extends StatelessWidget {
  final String text;
  const _Texts({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtils.pTop12Left10,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}
