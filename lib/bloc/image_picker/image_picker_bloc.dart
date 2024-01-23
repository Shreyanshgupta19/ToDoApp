import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:slider_and_swutchbutton_using_bloc/bloc/image_picker/image_picker_event.dart';
import 'package:slider_and_swutchbutton_using_bloc/utils/image_picker_utils.dart';

part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerStates> {

  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerStates()) {
    on<CameraCapture>(cameraCapture);
    on<GalleryImagePicker>(galleryImagePicker);
  }

  void cameraCapture(CameraCapture event, Emitter<ImagePickerStates> states) async{
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void galleryImagePicker(GalleryImagePicker event, Emitter<ImagePickerStates> states) async{
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));
  }

}
