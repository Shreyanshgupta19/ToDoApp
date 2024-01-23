import 'package:slider_and_swutchbutton_using_bloc/bloc/counter/counter_bloc.dart';
import 'package:slider_and_swutchbutton_using_bloc/bloc/image_picker/image_picker_bloc.dart';
import 'package:slider_and_swutchbutton_using_bloc/bloc/switch_example/switch_bloc.dart';
import 'package:slider_and_swutchbutton_using_bloc/bloc/todo/to_do_bloc.dart';
import 'package:slider_and_swutchbutton_using_bloc/ui_screens/counter/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slider_and_swutchbutton_using_bloc/ui_screens/image_picker/image_picker_screen.dart';
import 'package:slider_and_swutchbutton_using_bloc/ui_screens/switch_example/switch_example_screen.dart';
import 'package:slider_and_swutchbutton_using_bloc/ui_screens/todo/to_do_screen/to_do_screen.dart';
import 'package:slider_and_swutchbutton_using_bloc/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc(),),
        BlocProvider(create: (context) => SwitchBloc(),),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils()),),
        BlocProvider(create: (context) => ToDoBloc(),),
      ],
      child: MaterialApp(
        title: 'Build Multiple States',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
     //    home: const CounterScreen(),
     //    home: const SwitchExampleScreen(),
     //    home: const ImagePicker(),
         home: const ToDoScreen(),
      ),
    );
  }
}

// Bloc: event.dart -> state.dart -> bloc.dart