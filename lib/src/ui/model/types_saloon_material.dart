import 'package:barber_app/src/utils/images.dart';

class DummyModel {
  String name;
  String url;

  DummyModel({required this.url, required this.name});
}

List<DummyModel> dummyData = [
  DummyModel(url: AppImages.barber, name: 'Barbers'),
  DummyModel(url: AppImages.hair, name: 'Hairdressers'),
  DummyModel(url: AppImages.products, name: 'Beauty Salon'),
  DummyModel(url: AppImages.barber, name: 'Massage'),
  DummyModel(url: AppImages.hair, name: 'Hairdresser'),
  DummyModel(url: AppImages.products, name: 'Salon'),
];
