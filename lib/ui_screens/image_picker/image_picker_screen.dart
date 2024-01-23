import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slider_and_swutchbutton_using_bloc/bloc/image_picker/image_picker_bloc.dart';
import 'package:slider_and_swutchbutton_using_bloc/bloc/image_picker/image_picker_event.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});
  @override
  State<ImagePicker> createState() {
    return _ImagePickerState();
  }
}

class _ImagePickerState extends State<ImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image picker using Bloc'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ImagePickerBloc, ImagePickerStates>(
                buildWhen: (previous, current) => previous.file != current.file,
                builder: (context, state) {
                  if(state.file == null) {
                  return InkWell(
                  onTap: () {
                    context.read<ImagePickerBloc>().add(CameraCapture());
                  },
                  child: const CircleAvatar(
                  child: Icon(Icons.camera),
                  ),
                  );
                }
                  else{
                    return Image.file(File(state.file!.path.toString()));
                  }
                },
              ),
              const SizedBox(height: 10,),
              BlocBuilder<ImagePickerBloc, ImagePickerStates>(
                buildWhen: (previous, current) => previous.file != current.file,
                builder: (context, state) {
                  if(state.file == null) {
                    return InkWell(
                      onTap: () {
                        context.read<ImagePickerBloc>().add(GalleryImagePicker());
                      },
                      child: const CircleAvatar(
                        child: Icon(Icons.browse_gallery),
                      ),
                    );
                  }
                  else{
                    return Image.file(File(state.file!.path.toString()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}