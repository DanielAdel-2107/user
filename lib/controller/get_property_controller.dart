import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/model/property_model.dart';
import 'package:firstapp/services/firestore_property.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GetPropertyController extends GetxController{

  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<PropertyModel> get propertyModel => _propertyModel;

  List<PropertyModel> _propertyModel = [];

  List<PropertyModel> userList = [];

  getProperties() async{
    _loading.value = true;
    FireStoreProperty().getPropertiess().then((value){
      for(int i = 0; i < value.length; i++){
        _propertyModel.add(PropertyModel.fromJson(value[i].data() as Map));
        _loading.value = false;
      }
      for(int i = 0; i< _propertyModel.length; i++){
        if(propertyModel[i].userEmail == FirebaseAuth.instance.currentUser!.email){
          userList.add(propertyModel[i]);
        }
      }
      update();
    });
    }

    GetPropertyController(){
      getProperties();
    }

  List<PropertyModel> _listOfCards = [];

  List<PropertyModel> get listOfCards => _listOfCards;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // SharedPreferences.getInstance().then((SharedPreferences prefs){
    //   prefs.setBool('is_save', false);
    //   update();
    // });
    
  }

  void toggleFavourites(PropertyModel propertyModel) async{

    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final isExist = _listOfCards.contains(propertyModel);

    if(isExist){
       _listOfCards.remove(propertyModel);
      // sharedPreferences.setBool('is_save', true).then((value) {
      // _listOfCards.remove(propertyModel);
      // update();
      // });
    }
    else{
      _listOfCards.add(propertyModel);
      // sharedPreferences.setBool('is_save', false).then((value){
      //   _listOfCards.add(propertyModel);
      //   update();
      // });
    }

    update();
  }

  bool isExist( PropertyModel propertyModel){
    final isExist = _listOfCards.contains(propertyModel);
    return isExist;
  }
  void clearFavourites(){
    _listOfCards = [];
    update();
  }

  void getSearchList(String loc, String minPrice, String maxPrice){
    List filterList = propertyModel.where((element) => element.locationn!.contains(loc) || double.parse(element.price.toString()) > double.parse(minPrice) || double.parse(element.price.toString()) < double.parse(maxPrice)).toList();
    
  }

}