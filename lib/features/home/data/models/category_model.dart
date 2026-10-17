import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class CategoryModel {
  final String nameKey;
  final Color color;

  const CategoryModel({required this.nameKey, required this.color});
}

class CategoryData {
  const CategoryData._();

  static const List<CategoryModel> categories = [
    CategoryModel(nameKey: 'mechanic', color: AppColor.catMechanic),
    CategoryModel(nameKey: 'electrician', color: AppColor.catElectrician),
    CategoryModel(nameKey: 'plumber', color: AppColor.catPlumber),
    CategoryModel(nameKey: 'tutor', color: AppColor.catTutor),
    CategoryModel(nameKey: 'carpenter', color: AppColor.catCarpenter),
    CategoryModel(nameKey: 'painter', color: AppColor.catPainter),
    CategoryModel(nameKey: 'cleaning', color: AppColor.catCleaning),
    CategoryModel(nameKey: 'ac', color: AppColor.catAc),

    // Construction (البناء والإعمار)
    CategoryModel(nameKey: 'concreteWorker', color: AppColor.catConcreteWorker),
    CategoryModel(nameKey: 'plasterer', color: AppColor.catPlasterer),
    CategoryModel(nameKey: 'tiler', color: AppColor.catTiler),
    CategoryModel(nameKey: 'stonemason', color: AppColor.catStonemason),
    CategoryModel(nameKey: 'rebarWorker', color: AppColor.catRebarWorker),
    CategoryModel(nameKey: 'contractor', color: AppColor.catContractor),
    CategoryModel(nameKey: 'gypsumWorker', color: AppColor.catGypsumWorker),
    CategoryModel(nameKey: 'insulationWorker', color: AppColor.catInsulationWorker),

    // Maintenance (الصيانة والتمديدات)
    CategoryModel(nameKey: 'blacksmith', color: AppColor.catBlacksmith),
    CategoryModel(nameKey: 'aluminumInstaller', color: AppColor.catAluminumInstaller),
    CategoryModel(nameKey: 'glazier', color: AppColor.catGlazier),
    CategoryModel(nameKey: 'solarWaterHeaterInstaller', color: AppColor.catSolarWaterHeaterInstaller),
    CategoryModel(nameKey: 'generatorTechnician', color: AppColor.catGeneratorTechnician),
    CategoryModel(nameKey: 'solarPanelInstaller', color: AppColor.catSolarPanelInstaller),
    CategoryModel(nameKey: 'hvacTechnician', color: AppColor.catHvacTechnician),
    CategoryModel(nameKey: 'applianceRepair', color: AppColor.catApplianceRepair),
    CategoryModel(nameKey: 'satelliteAndCctvInstaller', color: AppColor.catSatelliteAndCctvInstaller),
    CategoryModel(nameKey: 'networkTechnician', color: AppColor.catNetworkTechnician),
    CategoryModel(nameKey: 'phoneAndPcRepair', color: AppColor.catPhoneAndPcRepair),

    // Vehicles (السيارات والآليات)
    CategoryModel(nameKey: 'autoElectrician', color: AppColor.catAutoElectrician),
    CategoryModel(nameKey: 'autoBodyRepair', color: AppColor.catAutoBodyRepair),
    CategoryModel(nameKey: 'autoPainter', color: AppColor.catAutoPainter),
    CategoryModel(nameKey: 'tireRepair', color: AppColor.catTireRepair),
    CategoryModel(nameKey: 'carWash', color: AppColor.catCarWash),
    CategoryModel(nameKey: 'towingService', color: AppColor.catTowingService),
    CategoryModel(nameKey: 'driverTransport', color: AppColor.catDriverTransport),
    CategoryModel(nameKey: 'excavationOperator', color: AppColor.catExcavationOperator),

    // Agriculture (الزراعة والأرض)
    CategoryModel(nameKey: 'farmer', color: AppColor.catFarmer),
    CategoryModel(nameKey: 'treePruning', color: AppColor.catTreePruning),
    CategoryModel(nameKey: 'landPlowing', color: AppColor.catLandPlowing),
    CategoryModel(nameKey: 'pesticideSpraying', color: AppColor.catPesticideSpraying),
    CategoryModel(nameKey: 'irrigationInstaller', color: AppColor.catIrrigationInstaller),
    CategoryModel(nameKey: 'beekeeper', color: AppColor.catBeekeeper),
    CategoryModel(nameKey: 'livestockBreeder', color: AppColor.catLivestockBreeder),
    CategoryModel(nameKey: 'gardener', color: AppColor.catGardener),
    CategoryModel(nameKey: 'landClearing', color: AppColor.catLandClearing),
    CategoryModel(nameKey: 'firewoodSupplier', color: AppColor.catFirewoodSupplier),

    // Food (الطعام والمونة)
    CategoryModel(nameKey: 'baker', color: AppColor.catBaker),
    CategoryModel(nameKey: 'snackChef', color: AppColor.catSnackChef),
    CategoryModel(nameKey: 'butcher', color: AppColor.catButcher),
    CategoryModel(nameKey: 'mounehMaker', color: AppColor.catMounehMaker),
    CategoryModel(nameKey: 'dairyMaker', color: AppColor.catDairyMaker),
    CategoryModel(nameKey: 'oliveOilPress', color: AppColor.catOliveOilPress),
    CategoryModel(nameKey: 'caterer', color: AppColor.catCaterer),
    CategoryModel(nameKey: 'sweetsMaker', color: AppColor.catSweetsMaker),

    // Personal services (خدمات شخصية ومنزلية)
    CategoryModel(nameKey: 'menBarber', color: AppColor.catMenBarber),
    CategoryModel(nameKey: 'womenHairdresser', color: AppColor.catWomenHairdresser),
    CategoryModel(nameKey: 'tailor', color: AppColor.catTailor),
    CategoryModel(nameKey: 'houseCleaning', color: AppColor.catHouseCleaning),
    CategoryModel(nameKey: 'waterTankCleaning', color: AppColor.catWaterTankCleaning),
    CategoryModel(nameKey: 'pestControl', color: AppColor.catPestControl),
    CategoryModel(nameKey: 'furnitureMoving', color: AppColor.catFurnitureMoving),
    CategoryModel(nameKey: 'waterDelivery', color: AppColor.catWaterDelivery),
    CategoryModel(nameKey: 'gasDelivery', color: AppColor.catGasDelivery),
    CategoryModel(nameKey: 'deliveryService', color: AppColor.catDeliveryService),

    // Other (مهن أخرى)
    CategoryModel(nameKey: 'photographer', color: AppColor.catPhotographer),
    CategoryModel(nameKey: 'djAndZaffe', color: AppColor.catDjAndZaffe),
    CategoryModel(nameKey: 'privateTutor', color: AppColor.catPrivateTutor),
    CategoryModel(nameKey: 'fitnessTrainer', color: AppColor.catFitnessTrainer),
    CategoryModel(nameKey: 'homeNurse', color: AppColor.catHomeNurse),
    CategoryModel(nameKey: 'eventEquipmentRental', color: AppColor.catEventEquipmentRental),
    CategoryModel(nameKey: 'watchRepair', color: AppColor.catWatchRepair),
    CategoryModel(nameKey: 'shoeRepair', color: AppColor.catShoeRepair),
    CategoryModel(nameKey: 'mobileVegetableVendor', color: AppColor.catMobileVegetableVendor),
  ];
}

String localizedSpecialization(
  BuildContext context,
  String? specializationKey,
) {
  if (specializationKey == null || specializationKey.isEmpty) return '';
  for (final category in CategoryData.categories) {
    if (category.nameKey == specializationKey) {
      return category.localizedName(context);
    }
  }
  return specializationKey;
}

extension CategoryLocalization on CategoryModel {
  String localizedName(BuildContext context) {
    final s = S.of(context);
    switch (nameKey) {
      case 'mechanic':
        return s.catMechanic;
      case 'electrician':
        return s.catElectrician;
      case 'plumber':
        return s.catPlumber;
      case 'tutor':
        return s.catTutor;
      case 'carpenter':
        return s.catCarpenter;
      case 'painter':
        return s.catPainter;
      case 'cleaning':
        return s.catCleaning;
      case 'ac':
        return s.catAc;
      case 'concreteWorker':
        return s.catConcreteWorker;
      case 'plasterer':
        return s.catPlasterer;
      case 'tiler':
        return s.catTiler;
      case 'stonemason':
        return s.catStonemason;
      case 'rebarWorker':
        return s.catRebarWorker;
      case 'contractor':
        return s.catContractor;
      case 'gypsumWorker':
        return s.catGypsumWorker;
      case 'insulationWorker':
        return s.catInsulationWorker;
      case 'blacksmith':
        return s.catBlacksmith;
      case 'aluminumInstaller':
        return s.catAluminumInstaller;
      case 'glazier':
        return s.catGlazier;
      case 'solarWaterHeaterInstaller':
        return s.catSolarWaterHeaterInstaller;
      case 'generatorTechnician':
        return s.catGeneratorTechnician;
      case 'solarPanelInstaller':
        return s.catSolarPanelInstaller;
      case 'hvacTechnician':
        return s.catHvacTechnician;
      case 'applianceRepair':
        return s.catApplianceRepair;
      case 'satelliteAndCctvInstaller':
        return s.catSatelliteAndCctvInstaller;
      case 'networkTechnician':
        return s.catNetworkTechnician;
      case 'phoneAndPcRepair':
        return s.catPhoneAndPcRepair;
      case 'autoElectrician':
        return s.catAutoElectrician;
      case 'autoBodyRepair':
        return s.catAutoBodyRepair;
      case 'autoPainter':
        return s.catAutoPainter;
      case 'tireRepair':
        return s.catTireRepair;
      case 'carWash':
        return s.catCarWash;
      case 'towingService':
        return s.catTowingService;
      case 'driverTransport':
        return s.catDriverTransport;
      case 'excavationOperator':
        return s.catExcavationOperator;
      case 'farmer':
        return s.catFarmer;
      case 'treePruning':
        return s.catTreePruning;
      case 'landPlowing':
        return s.catLandPlowing;
      case 'pesticideSpraying':
        return s.catPesticideSpraying;
      case 'irrigationInstaller':
        return s.catIrrigationInstaller;
      case 'beekeeper':
        return s.catBeekeeper;
      case 'livestockBreeder':
        return s.catLivestockBreeder;
      case 'gardener':
        return s.catGardener;
      case 'landClearing':
        return s.catLandClearing;
      case 'firewoodSupplier':
        return s.catFirewoodSupplier;
      case 'baker':
        return s.catBaker;
      case 'snackChef':
        return s.catSnackChef;
      case 'butcher':
        return s.catButcher;
      case 'mounehMaker':
        return s.catMounehMaker;
      case 'dairyMaker':
        return s.catDairyMaker;
      case 'oliveOilPress':
        return s.catOliveOilPress;
      case 'caterer':
        return s.catCaterer;
      case 'sweetsMaker':
        return s.catSweetsMaker;
      case 'menBarber':
        return s.catMenBarber;
      case 'womenHairdresser':
        return s.catWomenHairdresser;
      case 'tailor':
        return s.catTailor;
      case 'houseCleaning':
        return s.catHouseCleaning;
      case 'waterTankCleaning':
        return s.catWaterTankCleaning;
      case 'pestControl':
        return s.catPestControl;
      case 'furnitureMoving':
        return s.catFurnitureMoving;
      case 'waterDelivery':
        return s.catWaterDelivery;
      case 'gasDelivery':
        return s.catGasDelivery;
      case 'deliveryService':
        return s.catDeliveryService;
      case 'photographer':
        return s.catPhotographer;
      case 'djAndZaffe':
        return s.catDjAndZaffe;
      case 'privateTutor':
        return s.catPrivateTutor;
      case 'fitnessTrainer':
        return s.catFitnessTrainer;
      case 'homeNurse':
        return s.catHomeNurse;
      case 'eventEquipmentRental':
        return s.catEventEquipmentRental;
      case 'watchRepair':
        return s.catWatchRepair;
      case 'shoeRepair':
        return s.catShoeRepair;
      case 'mobileVegetableVendor':
        return s.catMobileVegetableVendor;
      default:
        return nameKey;
    }
  }
}
