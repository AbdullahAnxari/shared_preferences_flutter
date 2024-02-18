import '../../shared_preferences_flutter.dart';

class HomeController extends GetxController {
  final TextEditingController stringController = TextEditingController();
  final TextEditingController intController = TextEditingController();
  final TextEditingController stringModelController = TextEditingController();
  final TextEditingController intModelController = TextEditingController();
  bool isregister = false;
  bool isModelRegister = false;

  static final instance = Get.find<HomeController>();

  //*DIRECT SET BOOL VALUE OF ONLY SIWTCH BUTTON
  bool alarmSettingBoolValue = false;
  Future<void> handleAlarmSetting({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    alarmSettingBoolValue = value;
    await prefs.setBool('alarmSettingBoolValue', value);
    debugPrint('Switch alarm setting value: $alarmSettingBoolValue');
    update();
  }

  //*DIRECT GET BOOL VALUE OF ONLY SWITCH BUTTON
  Future<void> loadAlarmSetting() async {
    final prefs = await SharedPreferences.getInstance();
    var alarmSettingBool = prefs.getBool('alarmSettingBoolValue') ?? false;
    alarmSettingBoolValue = alarmSettingBool;
    update();
    debugPrint('Switch alarm setting value: $alarmSettingBoolValue');
  }
  //*setString
  Future<void> setStringData() async {
    final result = await SharedPreferencesService.getInstance();
    result.setStringData(name: stringController.text);
  }

  //*getString
  String stringData = 'N/A';
  Future<void> getStringData() async {
    final result = await SharedPreferencesService.getInstance();
    final data = await result.getStringData();
    data.fold((errorMessage) {
      Fluttertoast.showToast(msg: errorMessage);
    }, (fetcheddata) {
      if (fetcheddata != null) {
        stringData = fetcheddata;
        Fluttertoast.showToast(msg: 'Data Fetched');
      } else {
        Fluttertoast.showToast(msg: 'Fail to Fetch data');
      }
    });

    update();
    debugPrint('Images Path: ${await result.getStringData()}');
  }

  //*setInt
  Future<void> setIntData() async {
    int ageValue = int.parse(intController.text);
    final result = await SharedPreferencesService.getInstance();

    final data = await result.setIntData(age: ageValue);
    data.fold(
      (errorMessage) {
        Fluttertoast.showToast(msg: errorMessage);
      },
      (r) => null,
    );
  }

  //*get
  int? intData;
  Future<void> getIntData() async {
    final result = await SharedPreferencesService.getInstance();
    final data = await result.getIntData();
    data.fold((errorMessage) {
      Fluttertoast.showToast(msg: errorMessage);
    }, (fetchedData) {
      if (fetchedData != null) {
        intData = fetchedData;
        Fluttertoast.showToast(msg: 'Data Fetched');
      } else {
        Fluttertoast.showToast(msg: 'Fail to Fetch data');
      }
    });

    update();
    debugPrint('Int: ${await result.getIntData()}');
  }

  //*setModel
  Future<void> setModelData({required HomeModel model}) async {
    final result = await SharedPreferencesService.getInstance();
    final data = await result.setModelData(model: model);
    data.fold(
      (errorMessage) {
        Fluttertoast.showToast(msg: errorMessage);
      },
      (r) => null,
    );
  }

  //*get
  HomeModel model = HomeModel();
  Future<void> getModelData() async {
    final result = await SharedPreferencesService.getInstance();
    final data = result.getModelData();

    data.fold((errorMessage) {
      Fluttertoast.showToast(msg: errorMessage);
    }, (fetchedData) {
      if (fetchedData != null) {
        model = fetchedData;
        Fluttertoast.showToast(msg: 'Data Fetched');
      } else {
        Fluttertoast.showToast(msg: 'Fail to Fetch data');
      }
    });

    update();
    debugPrint('Model: ${result.getModelData()}');
  }

  //*
  Future<void> setBoolData({required bool isRegister}) async {
    final result = await SharedPreferencesService.getInstance();
    final data = await result.setBoolData(isregister: isRegister);
    data.fold(
      (errorMessage) {
        Fluttertoast.showToast(msg: errorMessage);
      },
      (r) => null,
    );
  }

  //*removedata
  Future<void> removeData({required data}) async {
    final result = await SharedPreferencesService.getInstance();
    final removeData = await result.removeData(data);
    removeData.fold(
      (errorMessage) {
        Fluttertoast.showToast(msg: errorMessage);
      },
      (successMessage) {
        Fluttertoast.showToast(msg: successMessage);
      },
    );
    debugPrint('result: $result');
    // ... remove other specific values as needed
  }

  //*
  Future<void> clearAllData() async {
    final result = await SharedPreferencesService.getInstance();
    final clearData = await result.clearAllData();
    clearData.fold(
      (errorMessage) {
        Fluttertoast.showToast(msg: errorMessage);
      },
      (successMessage) {
        Fluttertoast.showToast(msg: successMessage);
      },
    );
    // debugPrint('result: $result');
  }

  // //*InputField
  // Future<void> getInputData() async {
  //   try {
  //     prefs = await SharedPreferences.getInstance();

  //     final String? name = prefs.getString('name');
  //     final int? age = prefs.getInt('age');
  //     final bool? isregister = prefs.getBool('isregister');
  //     update();
  //     debugPrint('debud: $name');
  //     debugPrint('debud: $age');
  //     debugPrint('debud: $isregister');
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   }
  // }

  // //*
  // Future<void> setData() async {
  //   try {
  //     prefs = await SharedPreferences.getInstance();

  //     final homeModel = HomeModel(name: 'name', age: 9, isStudent: true);
  //     await prefs.setInt('counter', 100);
  //     await prefs.setBool('repeat', false);
  //     await prefs.setDouble('decimal', 1.5300);
  //     await prefs.setString('action', 'paused');
  //     await prefs
  //         .setStringList('items', <String>['Sky', 'Jupiter', 'Universe']);
  //     //model
  //     await prefs.setString('modelData', homeModel.toJson());
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   }
  // }

  // //*
  // Future<void> getData() async {
  //   prefs = await SharedPreferences.getInstance();

  //   final int? counter = prefs.getInt('counter');
  //   final bool? repeat = prefs.getBool('repeat');
  //   final double? decimal = prefs.getDouble('decimal');
  //   final String? action = prefs.getString('action');
  //   final List<String>? items = prefs.getStringList('items');

  //   final String? homeModel = prefs.getString('key');
  //   debugPrint('counter: $counter');
  //   debugPrint('repeat: $repeat');
  //   debugPrint('decimal: $decimal');
  //   debugPrint('action: $action');
  //   debugPrint('items: $items');
  //   //model
  //   debugPrint('homeModel: ${HomeModel.fromJson(homeModel!)}');
  // }
}
