import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slider_and_swutchbutton_using_bloc/bloc/switch_example/switch_bloc.dart';

class SwitchExampleScreen extends StatefulWidget {
  const SwitchExampleScreen({super.key});

  @override
  State<SwitchExampleScreen> createState() {
    return _SwitchExampleScreenState();
  }
}

class _SwitchExampleScreenState extends State<SwitchExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Build Multiple States'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notifications'),
                BlocBuilder<SwitchBloc, SwitchStates>(
                  buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
                    builder: (context, state) =>  Switch(
                        value: state.isSwitch, // true or false,
                        onChanged: (newValue){
                          context.read<SwitchBloc>().add(EnableOrDisableNotification());
                        }
                    ),
                ),

              ],
            ),
            const SizedBox(height: 30,),
            BlocBuilder<SwitchBloc, SwitchStates>(
                buildWhen: (previous, current) => previous.slider != current.slider,
                builder: (context, state) {
                  return Container(
                    height: 200,
                    color: Colors.red.withOpacity(state.slider),
                  );
                }
            ),

            const SizedBox(height: 50,),
            BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous, current) => previous.slider != current.slider,
              builder: (context, state) {
                return Slider(
                  value: state.slider, // 0.4, 0.1,....
                  onChanged: (value){
                    context.read<SwitchBloc>().add(SliderEvent(slider: value));
                  }
                );
              }
            ),
          // Slider(value: .4, onChanged: (value){} ),
          ],
        ),
      ),
    );
  }
}
