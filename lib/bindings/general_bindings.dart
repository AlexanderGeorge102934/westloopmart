import 'package:get/get.dart';
import 'package:startup_app/helpers/network_manager.dart';

class GeneralBindings extends Bindings{


  @override
  void dependencies(){
    Get.put(NetworkManager());
  }

}