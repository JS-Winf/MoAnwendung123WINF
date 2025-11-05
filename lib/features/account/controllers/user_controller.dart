import 'package:get/get.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final Rx<UserProfile?> user = Rx<UserProfile?>(null);
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      isLoading.value = true;
      final userRecord = await AuthenticationRepository.instance.currentUser();
      user.value = userRecord;
    } catch (e) {
      user.value = null;
    } finally {
      isLoading.value = false;
    }
  }

  String get userName {
    final storage = AuthenticationRepository.instance.deviceStorage;
    final isDemoUser = storage.read('demoUser') == true;
    
    return user.value?.name ?? 
           user.value?.nickname ?? 
           (isDemoUser ? 'Demo User' : 'HotShop User');
  }

  String get userEmail {
    final storage = AuthenticationRepository.instance.deviceStorage;
    final isDemoUser = storage.read('demoUser') == true;
    
    return user.value?.email ?? 
           (isDemoUser ? 'demo@test.com' : 'user@hotshop.com');
  }

  String get userId {
    final storage = AuthenticationRepository.instance.deviceStorage;
    final isDemoUser = storage.read('demoUser') == true;
    
    return user.value?.sub ?? 
           (isDemoUser ? 'demo|12345' : 'auth0|unknown');
  }
}