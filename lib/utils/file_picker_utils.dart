import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class MyFilePickerUtil {
  Future<File?> fromGallery() async {
    File? result;
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      // allowedExtensions:
      //     fileType == FileType.custom ? ["png", "jpg", "pdf", "jpeg"] : null,
    );
    if (pickedFile != null) {
      result = File(pickedFile.files.single.path!);
    }
    return result;
  }

  Future<File?> fromCamera() async {
    File? result;
    PickedFile? pickedFile = await
        // ignore: invalid_use_of_visible_for_testing_member
        ImagePicker.platform.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      result = File(pickedFile.path);
    }
    return result;
  }
}
