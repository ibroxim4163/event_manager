import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/local_structure/todo_local_structure.dart';
import 'data/repository/todo_repository.dart';
import 'logic/event_bloc/event_bloc.dart';
import 'logic/server_bloc.dart';
import 'presentation/main_page/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDataStructure.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventBloc>(
      create: (context) => EventBloc(
        repository: TodoRepository(
          const LocalDataStructure(),
        ),
      )..add(const LoadingEvent()),
      child: const MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
