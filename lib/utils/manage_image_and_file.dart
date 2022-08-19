

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class ManageImageAndFile {


  Future<XFile?> getImageByCamera() async{
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    return image;
  }


  Future<List<XFile>?> getImageByGallery() async{
    List<XFile>? files = <XFile>[];
      files = await ImagePicker().pickMultiImage();
    return files;
  }

  Future <List<XFile>> getDocuments() async{
    List<XFile> files = <XFile>[];
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom,allowMultiple: true, allowedExtensions: [ 'pdf', 'doc']);
    if(result!=null){
      files = result.paths.map((path) => XFile(path!)).toList();

    }
    return files;
  }

}