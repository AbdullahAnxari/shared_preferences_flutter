import '../../../shared_preferences_flutter.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: GetBuilder<HomeController>(
                  // init: controller.,
                  builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //*SetString
                    TextField(
                      controller: controller.stringController,
                      decoration:
                          const InputDecoration(hintText: 'Enter String'),
                    ),
                    smallHeight,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.setStringData,
                        child: const Text('setStringData'),
                      ),
                    ),

                    //*getString
                    smallHeight,
                    _rowText(
                      heading: 'String',
                      value: controller.stringData,
                    ),
                    smallHeight,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.getStringData,
                        child: const Text('getStringData'),
                      ),
                    ),

                    //*
                    smallHeight,
                    TextField(
                      controller: controller.intController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: 'Enter Int'),
                    ),
                    smallHeight,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.setIntData,
                        child: const Text('setIntData'),
                      ),
                    ),

                    _rowText(
                      heading: 'Int',
                      value: controller.intData.toString(),
                    ),

                    smallHeight,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.getIntData,
                        child: const Text('getIntData'),
                      ),
                    ),

                    //*Model
                    smallHeight,
                    TextField(
                      controller: controller.stringModelController,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(hintText: 'Enter Model String'),
                    ),
                    TextField(
                      controller: controller.intModelController,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(hintText: 'Enter model int'),
                    ),

                    //*setModel
                    smallHeight,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _setModelData,
                        child: const Text('setMOdel'),
                      ),
                    ),
                    //*GetModel
                    smallHeight,
                    _rowText(
                        heading: "Name", value: controller.model.name ?? "N/A"),
                    _rowText(
                        heading: "Age",
                        value: (controller.model.age ?? "N/A").toString()),
                    smallHeight,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.getModelData,
                        child: const Text('getMOdel'),
                      ),
                    ),

                    //*Remove
                    smallHeight,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.removeData(data: 'name');
                        },
                        child: const Text('RemoveData'),
                      ),
                    ),

                    //*Clear
                    smallHeight,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.clearAllData,
                        child: const Text('clearData'),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget get smallHeight => const SizedBox(height: 10);

  //*Setmodel
  void _setModelData() {
    final homeModel = HomeModel(
      name: controller.stringModelController.text,
      age: int.parse(controller.intModelController.text),
      isStudent: controller.isModelRegister,
    );

    controller.setModelData(model: homeModel);
  }

  //*
  Widget _rowText({
    required String heading,
    required String value,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //*
          Text(
            heading,
            overflow: TextOverflow.clip,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          //
          const SizedBox(width: 16),

          //*
          Text(value)
        ],
      );
}
