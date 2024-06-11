
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/controller/profile_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPropertyController extends GetxController{

  String? id, locationn, area, type, paymentType, amenty, noOfRooms, noOfBaths, price, downPayment, installmentValue, description;
  
  // String userPhone = ProfileController().userModel.phone.toString();

  // String userEmail = ProfileController().userModel.email.toString();

  // String userPhone = Get.find<ProfileController>().userModel.phone.toString();
  // String userEmail = Get.find<ProfileController>().userModel.email.toString();
  String userEmail = FirebaseAuth.instance.currentUser!.email.toString();

  var image;

  List<XFile> imageList = [];

  final imagePicker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> uploadImage() async{

    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    
    imageList.addAll(selectedImages!);
    update();

    // if(selectedImages!.isNotEmpty){
    //   imageList.addAll(selectedImages);
    // }
    // else{}

    // var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    // if(pickedImage != null){
    //     image = File(pickedImage.path);
    // }
    // else{}
  }

  CollectionReference properties = FirebaseFirestore.instance.collection('Assessor Properties');
  Future<void> addProperty() {
      return properties
          .add({
            'Location': locationn, 
            'area': area, 
            'type': type ,
            'price': price,
            'number of rooms':noOfRooms,
            'number of baths': noOfBaths,
            'Amenties': amenty,
            'payment type': paymentType,
            'down payment': downPayment,
            'installment value': installmentValue,
            'description': description,
            'user email': userEmail
            // 'broker phone': brokerPhone,
            // 'broker email': brokerEmail
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }


//---------------------------------------------------------------------------------------------------------------------------
  // var isLoading = false;

  // var propertyList = <PropertyModel>[];

  // Future<void> getData()async{

  //   try{
  //     QuerySnapshot properties = await FirebaseFirestore.instance.collection('Properties').get();

  //     propertyList.clear();

  //     for(var property in properties.docs){
  //       propertyList.add(PropertyModel(property.id, property['location'], property['area'], property['type'], property['number of rooms'], property['number of baths'], property['amenties'], property['payment type'], property['down payment'], property['installment value']));
  //     }
  //     isLoading = false;

  //   }catch(e){
  //       Get.snackbar('error', '${e.toString()}');
  //   }
  // }

}