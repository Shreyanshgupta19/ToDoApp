part of 'image_picker_bloc.dart';

@immutable
 class ImagePickerStates extends Equatable {
  const ImagePickerStates({this.file});
  final XFile? file;

  ImagePickerStates copyWith({XFile? file}) {
    return ImagePickerStates(file: file ?? this.file);
}

  @override
  List<Object?> get props => [file];
}

