import 'dart:math';

import 'package:flutter/material.dart';

/// App color palette (roles, status, neutrals).
class AppColor {
  const AppColor._();

  // Role colors — ألوان الأدوار
  /// CTA / Primary action — إجراء رئيسي.
  static const Color roleCTA = Color(0xFFC1743B);

  /// Manager — مسؤول.
  static const Color roleManager = Color(0xFF33507A);

  /// Specialist — أخصائي.
  static const Color roleSpecialist = Color(0xFFB23F2B);

  /// Client / Primary brand color — عميل - أساسي.
  static const Color roleClientPrimary = Color(0xFF0F6B62);

  // Status colors — ألوان الحالة
  /// Error / Rejected — خطأ / رفض.
  static const Color statusError = Color(0xFFC0392B);

  /// Pending review — قيد المراجعة.
  static const Color statusPending = Color(0xFFC68A1E);

  /// Success / Verified — نجاح / موثّق.
  static const Color statusSuccess = Color(0xFF2E8B57);

  /// In progress — قيد التنفيذ.
  static const Color statusInProgress = Color(0xFF2E6DB4);

  // Neutral colors — ألوان محايدة
  /// Primary text color.
  static const Color textPrimary = Color(0xFF2B2621);

  /// Secondary / muted text color.
  static const Color textSecondary = Color(0xFF6B6255);

  /// Borders / dividers — حدود / فواصل.
  static const Color border = Color(0xFFECE6DA);

  /// Background — خلفية.
  static const Color background = Color(0xFFFAF7F2);

  // Role selection card backgrounds — خلفيات بطاقات اختيار الدور
  /// Client role card background — خلفية بطاقة العميل.
  static const Color roleClientBackground = Color(0xFFE4F1EE);

  /// Specialist role card background — خلفية بطاقة الأخصائي.
  static const Color roleSpecialistBackground = Color(0xFFF7E7E1);

  /// Card surface — سطح البطاقة.
  static const Color surface = Color(0xFFFFFFFF);

  static const Color catMechanic = Color(0xFF3B5BA5);
  static const Color catElectrician = Color(0xFFE0A72E);
  static const Color catPlumber = Color(0xFF2E86AB);
  static const Color catTutor = Color(0xFF6A4C93);
  static const Color catCarpenter = Color(0xFF8B5A2B);
  static const Color catPainter = Color(0xFFD1495B);
  static const Color catCleaning = Color(0xFF4CAF88);
  static const Color catAc = Color(0xFF00A5CF);

  // Construction (البناء والإعمار)
  static const Color catConcreteWorker = Color(0xFF8D8D8D);
  static const Color catPlasterer = Color(0xFFC2A878);
  static const Color catTiler = Color(0xFFB85C38);
  static const Color catStonemason = Color(0xFF7D6250);
  static const Color catRebarWorker = Color(0xFF5C5C5C);
  static const Color catContractor = Color(0xFF3E5C76);
  static const Color catGypsumWorker = Color(0xFFD8B384);
  static const Color catInsulationWorker = Color(0xFF4F6D5A);

  // Maintenance (الصيانة والتمديدات)
  static const Color catBlacksmith = Color(0xFF4A4238);
  static const Color catAluminumInstaller = Color(0xFFA8B4BC);
  static const Color catGlazier = Color(0xFF8FD9E8);
  static const Color catSolarWaterHeaterInstaller = Color(0xFFF2A65A);
  static const Color catGeneratorTechnician = Color(0xFF6B7A8F);
  static const Color catSolarPanelInstaller = Color(0xFF2E5090);
  static const Color catHvacTechnician = Color(0xFF3AAFB9);
  static const Color catApplianceRepair = Color(0xFF7C83FD);
  static const Color catSatelliteAndCctvInstaller = Color(0xFF495867);
  static const Color catNetworkTechnician = Color(0xFF577590);
  static const Color catPhoneAndPcRepair = Color(0xFF43AA8B);

  // Vehicles (السيارات والآليات)
  static const Color catAutoElectrician = Color(0xFFE36414);
  static const Color catAutoBodyRepair = Color(0xFF9A031E);
  static const Color catAutoPainter = Color(0xFFD62839);
  static const Color catTireRepair = Color(0xFF22223B);
  static const Color catCarWash = Color(0xFF1B98E0);
  static const Color catTowingService = Color(0xFFFCA311);
  static const Color catDriverTransport = Color(0xFF14213D);
  static const Color catExcavationOperator = Color(0xFFB08968);

  // Agriculture (الزراعة والأرض)
  static const Color catFarmer = Color(0xFF6A994E);
  static const Color catTreePruning = Color(0xFF386641);
  static const Color catLandPlowing = Color(0xFFA98467);
  static const Color catPesticideSpraying = Color(0xFF588157);
  static const Color catIrrigationInstaller = Color(0xFF457B9D);
  static const Color catBeekeeper = Color(0xFFFFB703);
  static const Color catLivestockBreeder = Color(0xFFBC6C25);
  static const Color catGardener = Color(0xFF52B788);
  static const Color catLandClearing = Color(0xFF6B9080);
  static const Color catFirewoodSupplier = Color(0xFF7F5539);

  // Food (الطعام والمونة)
  static const Color catBaker = Color(0xFFE09F3E);
  static const Color catSnackChef = Color(0xFFFF6B35);
  static const Color catButcher = Color(0xFF9E2A2B);
  static const Color catMounehMaker = Color(0xFF6F1D1B);
  static const Color catDairyMaker = Color(0xFFA7C957);
  static const Color catOliveOilPress = Color(0xFF606C38);
  static const Color catCaterer = Color(0xFFBC4749);
  static const Color catSweetsMaker = Color(0xFFE4A0B7);

  // Personal services (خدمات شخصية ومنزلية)
  static const Color catMenBarber = Color(0xFF3C096C);
  static const Color catWomenHairdresser = Color(0xFFD291BC);
  static const Color catTailor = Color(0xFF6D6875);
  static const Color catHouseCleaning = Color(0xFF5FA8D3);
  static const Color catWaterTankCleaning = Color(0xFF219EBC);
  static const Color catPestControl = Color(0xFF8338EC);
  static const Color catFurnitureMoving = Color(0xFFFB8500);
  static const Color catWaterDelivery = Color(0xFF48CAE4);
  static const Color catGasDelivery = Color(0xFFE63946);
  static const Color catDeliveryService = Color(0xFFFB5607);

  // Other (مهن أخرى)
  static const Color catPhotographer = Color(0xFF2B2D42);
  static const Color catDjAndZaffe = Color(0xFFFF006E);
  static const Color catPrivateTutor = Color(0xFF3A86FF);
  static const Color catFitnessTrainer = Color(0xFF06D6A0);
  static const Color catHomeNurse = Color(0xFFEF476F);
  static const Color catEventEquipmentRental = Color(0xFFFFD166);
  static const Color catWatchRepair = Color(0xFF073B4C);
  static const Color catShoeRepair = Color(0xFF8D5B4C);
  static const Color catMobileVegetableVendor = Color(0xFF83A603);
}
