// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `عبد الله`
  String get UserLoginHitn {
    return Intl.message('عبد الله', name: 'UserLoginHitn', desc: '', args: []);
  }

  /// `البريد الإلكتروني`
  String get emailLabelTextForEmail {
    return Intl.message(
      'البريد الإلكتروني',
      name: 'emailLabelTextForEmail',
      desc: '',
      args: [],
    );
  }

  /// `أو`
  String get authOr {
    return Intl.message('أو', name: 'authOr', desc: '', args: []);
  }

  /// `إنشاء حساب`
  String get register {
    return Intl.message('إنشاء حساب', name: 'register', desc: '', args: []);
  }

  /// `هل لديك حساب؟`
  String get youHaveAccount {
    return Intl.message(
      'هل لديك حساب؟',
      name: 'youHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get login {
    return Intl.message('تسجيل الدخول', name: 'login', desc: '', args: []);
  }

  /// `أدخل بياناتك لإنشاء حساب جديد`
  String get registerHint {
    return Intl.message(
      'أدخل بياناتك لإنشاء حساب جديد',
      name: 'registerHint',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get PasswordLabelTextForPassword {
    return Intl.message(
      'كلمة المرور',
      name: 'PasswordLabelTextForPassword',
      desc: '',
      args: [],
    );
  }

  /// `أدخل كلمة المرور`
  String get PasswordLabelTextHint {
    return Intl.message(
      'أدخل كلمة المرور',
      name: 'PasswordLabelTextHint',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول عبر Google`
  String get GoogleLogin {
    return Intl.message(
      'تسجيل الدخول عبر Google',
      name: 'GoogleLogin',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول عبر Apple`
  String get AppleLogin {
    return Intl.message(
      'تسجيل الدخول عبر Apple',
      name: 'AppleLogin',
      desc: '',
      args: [],
    );
  }

  /// `احجز مجددا`
  String get BookAgin {
    return Intl.message('احجز مجددا', name: 'BookAgin', desc: '', args: []);
  }

  /// `مثال: example@email.com`
  String get emailLabelTextHint {
    return Intl.message(
      'مثال: example@email.com',
      name: 'emailLabelTextHint',
      desc: '',
      args: [],
    );
  }

  /// `الاسم الكامل`
  String get LabelTextForName {
    return Intl.message(
      'الاسم الكامل',
      name: 'LabelTextForName',
      desc: '',
      args: [],
    );
  }

  /// `حساب أخصائي`
  String get SpecialistTitle {
    return Intl.message(
      'حساب أخصائي',
      name: 'SpecialistTitle',
      desc: '',
      args: [],
    );
  }

  /// `حساب عميل`
  String get UserLogin {
    return Intl.message('حساب عميل', name: 'UserLogin', desc: '', args: []);
  }

  /// `مكتشف الخدمات المحلية`
  String get appTitle {
    return Intl.message(
      'مكتشف الخدمات المحلية',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `اعثر على أخصائي موثوق بالقرب منك`
  String get splashTagline {
    return Intl.message(
      'اعثر على أخصائي موثوق بالقرب منك',
      name: 'splashTagline',
      desc: '',
      args: [],
    );
  }

  /// `اضغط للمتابعة`
  String get splashTapToContinue {
    return Intl.message(
      'اضغط للمتابعة',
      name: 'splashTapToContinue',
      desc: '',
      args: [],
    );
  }

  /// `جارٍ التحميل…`
  String get splashLoading {
    return Intl.message(
      'جارٍ التحميل…',
      name: 'splashLoading',
      desc: '',
      args: [],
    );
  }

  /// `أهلاً بك`
  String get roleSelectWelcome {
    return Intl.message(
      'أهلاً بك',
      name: 'roleSelectWelcome',
      desc: '',
      args: [],
    );
  }

  /// `كيف تريد استخدام التطبيق؟`
  String get roleSelectQuestion {
    return Intl.message(
      'كيف تريد استخدام التطبيق؟',
      name: 'roleSelectQuestion',
      desc: '',
      args: [],
    );
  }

  /// `أنا عميل`
  String get roleClientTitle {
    return Intl.message(
      'أنا عميل',
      name: 'roleClientTitle',
      desc: '',
      args: [],
    );
  }

  /// `أبحث عن أخصائي لخدمة أحتاجها`
  String get roleClientSubtitle {
    return Intl.message(
      'أبحث عن أخصائي لخدمة أحتاجها',
      name: 'roleClientSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `أنا أخصائي`
  String get roleSpecialistTitle {
    return Intl.message(
      'أنا أخصائي',
      name: 'roleSpecialistTitle',
      desc: '',
      args: [],
    );
  }

  /// `أقدّم خدمة وأريد استقبال طلبات`
  String get roleSpecialistSubtitle {
    return Intl.message(
      'أقدّم خدمة وأريد استقبال طلبات',
      name: 'roleSpecialistSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `دخول كمسؤول منصّة`
  String get roleAdminLogin {
    return Intl.message(
      'دخول كمسؤول منصّة',
      name: 'roleAdminLogin',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get authLoginTitle {
    return Intl.message(
      'تسجيل الدخول',
      name: 'authLoginTitle',
      desc: '',
      args: [],
    );
  }

  /// `أدخل رقم هاتفك وسنرسل لك رمز تأكيد عبر رسالة نصية`
  String get authLoginSubtitle {
    return Intl.message(
      'أدخل رقم هاتفك وسنرسل لك رمز تأكيد عبر رسالة نصية',
      name: 'authLoginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `تم تسجيل الدخول بنجاح`
  String get authLoginSuccess {
    return Intl.message(
      'تم تسجيل الدخول بنجاح',
      name: 'authLoginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `تم إنشاء الحساب بنجاح`
  String get authRegisterSuccess {
    return Intl.message(
      'تم إنشاء الحساب بنجاح',
      name: 'authRegisterSuccess',
      desc: '',
      args: [],
    );
  }

  /// `رقم الهاتف`
  String get authPhoneLabel {
    return Intl.message(
      'رقم الهاتف',
      name: 'authPhoneLabel',
      desc: '',
      args: [],
    );
  }

  /// `03 123 456`
  String get authPhoneHint {
    return Intl.message(
      '03 123 456',
      name: 'authPhoneHint',
      desc: '',
      args: [],
    );
  }

  /// `أدخل رمز التأكيد`
  String get authOtpTitle {
    return Intl.message(
      'أدخل رمز التأكيد',
      name: 'authOtpTitle',
      desc: '',
      args: [],
    );
  }

  /// `أرسلنا رمزاً مكوناً من 4 أرقام إلى الرقم {phone}`
  String authOtpSubtitle(String phone) {
    return Intl.message(
      'أرسلنا رمزاً مكوناً من 4 أرقام إلى الرقم $phone',
      name: 'authOtpSubtitle',
      desc: '',
      args: [phone],
    );
  }

  /// `اكتب الرمز هنا: 1234`
  String get authOtpHint {
    return Intl.message(
      'اكتب الرمز هنا: 1234',
      name: 'authOtpHint',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد الدخول`
  String get authOtpConfirm {
    return Intl.message(
      'تأكيد الدخول',
      name: 'authOtpConfirm',
      desc: '',
      args: [],
    );
  }

  /// `إعادة إرسال الرمز`
  String get authOtpResend {
    return Intl.message(
      'إعادة إرسال الرمز',
      name: 'authOtpResend',
      desc: '',
      args: [],
    );
  }

  /// `تخطي`
  String get tutorialSkip {
    return Intl.message('تخطي', name: 'tutorialSkip', desc: '', args: []);
  }

  /// `ابحث عن أخصائي بسهولة`
  String get tutorial1Title {
    return Intl.message(
      'ابحث عن أخصائي بسهولة',
      name: 'tutorial1Title',
      desc: '',
      args: [],
    );
  }

  /// `تصفّح الفئات أو استخدم البحث الصوتي للعثور على من تحتاجه بالقرب منك.`
  String get tutorial1Body {
    return Intl.message(
      'تصفّح الفئات أو استخدم البحث الصوتي للعثور على من تحتاجه بالقرب منك.',
      name: 'tutorial1Body',
      desc: '',
      args: [],
    );
  }

  /// `احجز موعدك بضغطة واحدة`
  String get tutorial2Title {
    return Intl.message(
      'احجز موعدك بضغطة واحدة',
      name: 'tutorial2Title',
      desc: '',
      args: [],
    );
  }

  /// `اختر الوقت المناسب لك وأرسل طلب الحجز مباشرة إلى الأخصائي.`
  String get tutorial2Body {
    return Intl.message(
      'اختر الوقت المناسب لك وأرسل طلب الحجز مباشرة إلى الأخصائي.',
      name: 'tutorial2Body',
      desc: '',
      args: [],
    );
  }

  /// `تابع وتواصل بأمان`
  String get tutorial3Title {
    return Intl.message(
      'تابع وتواصل بأمان',
      name: 'tutorial3Title',
      desc: '',
      args: [],
    );
  }

  /// `راقب حالة طلبك وتحدث مع الأخصائي داخل التطبيق حتى انتهاء الخدمة.`
  String get tutorial3Body {
    return Intl.message(
      'راقب حالة طلبك وتحدث مع الأخصائي داخل التطبيق حتى انتهاء الخدمة.',
      name: 'tutorial3Body',
      desc: '',
      args: [],
    );
  }

  /// `التالي`
  String get tutorialNext {
    return Intl.message('التالي', name: 'tutorialNext', desc: '', args: []);
  }

  /// `ابدأ الآن`
  String get tutorialStart {
    return Intl.message('ابدأ الآن', name: 'tutorialStart', desc: '', args: []);
  }

  /// `أهلاً بك 👋`
  String get homeGreeting {
    return Intl.message(
      'أهلاً بك 👋',
      name: 'homeGreeting',
      desc: '',
      args: [],
    );
  }

  /// `بماذا نساعدك اليوم؟`
  String get homeQuestion {
    return Intl.message(
      'بماذا نساعدك اليوم؟',
      name: 'homeQuestion',
      desc: '',
      args: [],
    );
  }

  /// `ابحث عن خدمة، مثال: كهربائي`
  String get homeSearchHint {
    return Intl.message(
      'ابحث عن خدمة، مثال: كهربائي',
      name: 'homeSearchHint',
      desc: '',
      args: [],
    );
  }

  /// `الفئات`
  String get homeCategoriesTitle {
    return Intl.message(
      'الفئات',
      name: 'homeCategoriesTitle',
      desc: '',
      args: [],
    );
  }

  /// `عرض الكل`
  String get homeViewAll {
    return Intl.message('عرض الكل', name: 'homeViewAll', desc: '', args: []);
  }

  /// `احجز مرة أخرى`
  String get homeBookAgainTitle {
    return Intl.message(
      'احجز مرة أخرى',
      name: 'homeBookAgainTitle',
      desc: '',
      args: [],
    );
  }

  /// `احجز مجدداً`
  String get homeBookAgainAction {
    return Intl.message(
      'احجز مجدداً',
      name: 'homeBookAgainAction',
      desc: '',
      args: [],
    );
  }

  /// `كل الفئات`
  String get categoriesTitle {
    return Intl.message(
      'كل الفئات',
      name: 'categoriesTitle',
      desc: '',
      args: [],
    );
  }

  /// `ابحث بالاسم أو الخدمة`
  String get resultsSearchHint {
    return Intl.message(
      'ابحث بالاسم أو الخدمة',
      name: 'resultsSearchHint',
      desc: '',
      args: [],
    );
  }

  /// `كل الأخصائيين`
  String get resultsAllTitle {
    return Intl.message(
      'كل الأخصائيين',
      name: 'resultsAllTitle',
      desc: '',
      args: [],
    );
  }

  /// `موثّق`
  String get resultsVerifiedBadge {
    return Intl.message(
      'موثّق',
      name: 'resultsVerifiedBadge',
      desc: '',
      args: [],
    );
  }

  /// `لم نجد أي نتائج`
  String get resultsEmptyTitle {
    return Intl.message(
      'لم نجد أي نتائج',
      name: 'resultsEmptyTitle',
      desc: '',
      args: [],
    );
  }

  /// `جرّب كلمة بحث أخرى أو تصفّح الفئات المتوفرة`
  String get resultsEmptyBody {
    return Intl.message(
      'جرّب كلمة بحث أخرى أو تصفّح الفئات المتوفرة',
      name: 'resultsEmptyBody',
      desc: '',
      args: [],
    );
  }

  /// `إعادة المحاولة`
  String get resultsRetry {
    return Intl.message(
      'إعادة المحاولة',
      name: 'resultsRetry',
      desc: '',
      args: [],
    );
  }

  /// `صورة الأخصائي`
  String get profilePhotoPlaceholder {
    return Intl.message(
      'صورة الأخصائي',
      name: 'profilePhotoPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `تقييم`
  String get profileReviewsCountSuffix {
    return Intl.message(
      'تقييم',
      name: 'profileReviewsCountSuffix',
      desc: '',
      args: [],
    );
  }

  /// `المسافة`
  String get profileDistanceLabel {
    return Intl.message(
      'المسافة',
      name: 'profileDistanceLabel',
      desc: '',
      args: [],
    );
  }

  /// `نطاق السعر`
  String get profilePriceRangeLabel {
    return Intl.message(
      'نطاق السعر',
      name: 'profilePriceRangeLabel',
      desc: '',
      args: [],
    );
  }

  /// `نبذة`
  String get profileBioTitle {
    return Intl.message('نبذة', name: 'profileBioTitle', desc: '', args: []);
  }

  /// `التقييمات`
  String get profileReviewsTitle {
    return Intl.message(
      'التقييمات',
      name: 'profileReviewsTitle',
      desc: '',
      args: [],
    );
  }

  /// `جارِ الاتصال بـ {name}…`
  String profileCallToast(String name) {
    return Intl.message(
      'جارِ الاتصال بـ $name…',
      name: 'profileCallToast',
      desc: '',
      args: [name],
    );
  }

  /// `احجز الآن`
  String get profileBookNow {
    return Intl.message(
      'احجز الآن',
      name: 'profileBookNow',
      desc: '',
      args: [],
    );
  }

  /// `تعذر فتح تطبيق الاتصال`
  String get profileCallFailed {
    return Intl.message(
      'تعذر فتح تطبيق الاتصال',
      name: 'profileCallFailed',
      desc: '',
      args: [],
    );
  }

  /// `حجز موعد`
  String get bookingTitle {
    return Intl.message('حجز موعد', name: 'bookingTitle', desc: '', args: []);
  }

  /// `ص`
  String get bookingTimeAm {
    return Intl.message('ص', name: 'bookingTimeAm', desc: '', args: []);
  }

  /// `م`
  String get bookingTimePm {
    return Intl.message('م', name: 'bookingTimePm', desc: '', args: []);
  }

  /// `اختر اليوم المناسب`
  String get bookingChooseDay {
    return Intl.message(
      'اختر اليوم المناسب',
      name: 'bookingChooseDay',
      desc: '',
      args: [],
    );
  }

  /// `اختر الوقت`
  String get bookingChooseTime {
    return Intl.message(
      'اختر الوقت',
      name: 'bookingChooseTime',
      desc: '',
      args: [],
    );
  }

  /// `متابعة`
  String get bookingContinue {
    return Intl.message('متابعة', name: 'bookingContinue', desc: '', args: []);
  }

  /// `العنوان`
  String get bookingAddressLabel {
    return Intl.message(
      'العنوان',
      name: 'bookingAddressLabel',
      desc: '',
      args: [],
    );
  }

  /// `مثال: برمّانا، جبل لبنان`
  String get bookingAddressHint {
    return Intl.message(
      'مثال: برمّانا، جبل لبنان',
      name: 'bookingAddressHint',
      desc: '',
      args: [],
    );
  }

  /// `وصف المشكلة (اختياري)`
  String get bookingNoteLabel {
    return Intl.message(
      'وصف المشكلة (اختياري)',
      name: 'bookingNoteLabel',
      desc: '',
      args: [],
    );
  }

  /// `اكتب تفاصيل إضافية تساعد الأخصائي...`
  String get bookingNoteHint {
    return Intl.message(
      'اكتب تفاصيل إضافية تساعد الأخصائي...',
      name: 'bookingNoteHint',
      desc: '',
      args: [],
    );
  }

  /// `أو استخدم التسجيل الصوتي لوصف الطلب`
  String get bookingVoiceHint {
    return Intl.message(
      'أو استخدم التسجيل الصوتي لوصف الطلب',
      name: 'bookingVoiceHint',
      desc: '',
      args: [],
    );
  }

  /// `الموعد المختار`
  String get bookingChosenTimeTitle {
    return Intl.message(
      'الموعد المختار',
      name: 'bookingChosenTimeTitle',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد الحجز`
  String get bookingConfirm {
    return Intl.message(
      'تأكيد الحجز',
      name: 'bookingConfirm',
      desc: '',
      args: [],
    );
  }

  /// `تم إرسال طلب الحجز`
  String get bookingConfirmTitle {
    return Intl.message(
      'تم إرسال طلب الحجز',
      name: 'bookingConfirmTitle',
      desc: '',
      args: [],
    );
  }

  /// `سيصلك إشعار فور موافقة الأخصائي على طلبك. يمكنك متابعة حالة الحجز من صفحة الحجوزات.`
  String get bookingConfirmBody {
    return Intl.message(
      'سيصلك إشعار فور موافقة الأخصائي على طلبك. يمكنك متابعة حالة الحجز من صفحة الحجوزات.',
      name: 'bookingConfirmBody',
      desc: '',
      args: [],
    );
  }

  /// `الموعد`
  String get bookingConfirmAppointmentLabel {
    return Intl.message(
      'الموعد',
      name: 'bookingConfirmAppointmentLabel',
      desc: '',
      args: [],
    );
  }

  /// `العنوان`
  String get bookingConfirmAddressLabel {
    return Intl.message(
      'العنوان',
      name: 'bookingConfirmAddressLabel',
      desc: '',
      args: [],
    );
  }

  /// `تتبّع حالة الحجز`
  String get bookingConfirmTrack {
    return Intl.message(
      'تتبّع حالة الحجز',
      name: 'bookingConfirmTrack',
      desc: '',
      args: [],
    );
  }

  /// `العودة للرئيسية`
  String get bookingConfirmBackHome {
    return Intl.message(
      'العودة للرئيسية',
      name: 'bookingConfirmBackHome',
      desc: '',
      args: [],
    );
  }

  /// `حالة الحجز`
  String get trackingTitle {
    return Intl.message(
      'حالة الحجز',
      name: 'trackingTitle',
      desc: '',
      args: [],
    );
  }

  /// `تحديث الحالة (للعرض التجريبي)`
  String get trackingRefreshDemo {
    return Intl.message(
      'تحديث الحالة (للعرض التجريبي)',
      name: 'trackingRefreshDemo',
      desc: '',
      args: [],
    );
  }

  /// `محادثة`
  String get trackingChat {
    return Intl.message('محادثة', name: 'trackingChat', desc: '', args: []);
  }

  /// `قيّم الخدمة الآن`
  String get trackingRateNow {
    return Intl.message(
      'قيّم الخدمة الآن',
      name: 'trackingRateNow',
      desc: '',
      args: [],
    );
  }

  /// `تم الطلب`
  String get trackStepOrdered {
    return Intl.message(
      'تم الطلب',
      name: 'trackStepOrdered',
      desc: '',
      args: [],
    );
  }

  /// `تم القبول`
  String get trackStepAccepted {
    return Intl.message(
      'تم القبول',
      name: 'trackStepAccepted',
      desc: '',
      args: [],
    );
  }

  /// `قيد التنفيذ`
  String get trackStepInProgress {
    return Intl.message(
      'قيد التنفيذ',
      name: 'trackStepInProgress',
      desc: '',
      args: [],
    );
  }

  /// `مكتمل`
  String get trackStepDone {
    return Intl.message('مكتمل', name: 'trackStepDone', desc: '', args: []);
  }

  /// `تم`
  String get trackStepDoneTime {
    return Intl.message('تم', name: 'trackStepDoneTime', desc: '', args: []);
  }

  /// `الحالة الحالية`
  String get trackStepCurrentTime {
    return Intl.message(
      'الحالة الحالية',
      name: 'trackStepCurrentTime',
      desc: '',
      args: [],
    );
  }

  /// `قادم`
  String get trackStepUpcomingTime {
    return Intl.message(
      'قادم',
      name: 'trackStepUpcomingTime',
      desc: '',
      args: [],
    );
  }

  /// `تم الرفض`
  String get trackStepRejected {
    return Intl.message(
      'تم الرفض',
      name: 'trackStepRejected',
      desc: '',
      args: [],
    );
  }

  /// `يجب عليك تأكيد تفاصيل الطلب من خلال الاتصال به`
  String get trackStepAcceptedConfirmNote {
    return Intl.message(
      'يجب عليك تأكيد تفاصيل الطلب من خلال الاتصال به',
      name: 'trackStepAcceptedConfirmNote',
      desc: '',
      args: [],
    );
  }

  /// `متصل الآن`
  String get chatOnlineNow {
    return Intl.message('متصل الآن', name: 'chatOnlineNow', desc: '', args: []);
  }

  /// `اكتب رسالتك هنا...`
  String get chatInputHint {
    return Intl.message(
      'اكتب رسالتك هنا...',
      name: 'chatInputHint',
      desc: '',
      args: [],
    );
  }

  /// `العميل`
  String get chatDefaultPartner {
    return Intl.message(
      'العميل',
      name: 'chatDefaultPartner',
      desc: '',
      args: [],
    );
  }

  /// `كيف كانت تجربتك مع {name}؟`
  String reviewQuestion(String name) {
    return Intl.message(
      'كيف كانت تجربتك مع $name؟',
      name: 'reviewQuestion',
      desc: '',
      args: [name],
    );
  }

  /// `اكتب تعليقك (اختياري)...`
  String get reviewCommentHint {
    return Intl.message(
      'اكتب تعليقك (اختياري)...',
      name: 'reviewCommentHint',
      desc: '',
      args: [],
    );
  }

  /// `إرسال التقييم`
  String get reviewSubmit {
    return Intl.message(
      'إرسال التقييم',
      name: 'reviewSubmit',
      desc: '',
      args: [],
    );
  }

  /// `الحجوزات السابقة`
  String get menuPastBookings {
    return Intl.message(
      'الحجوزات السابقة',
      name: 'menuPastBookings',
      desc: '',
      args: [],
    );
  }

  /// `العناوين المحفوظة`
  String get menuSavedAddresses {
    return Intl.message(
      'العناوين المحفوظة',
      name: 'menuSavedAddresses',
      desc: '',
      args: [],
    );
  }

  /// `الإشعارات`
  String get menuNotifications {
    return Intl.message(
      'الإشعارات',
      name: 'menuNotifications',
      desc: '',
      args: [],
    );
  }

  /// `الإعدادات`
  String get menuSettings {
    return Intl.message('الإعدادات', name: 'menuSettings', desc: '', args: []);
  }

  /// `المساعدة والدعم`
  String get menuHelpSupport {
    return Intl.message(
      'المساعدة والدعم',
      name: 'menuHelpSupport',
      desc: '',
      args: [],
    );
  }

  /// `ملفي وخدماتي`
  String get menuMyProfileServices {
    return Intl.message(
      'ملفي وخدماتي',
      name: 'menuMyProfileServices',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الخروج`
  String get logout {
    return Intl.message('تسجيل الخروج', name: 'logout', desc: '', args: []);
  }

  /// `إنشاء حساب أخصائي`
  String get specSignupTitle {
    return Intl.message(
      'إنشاء حساب أخصائي',
      name: 'specSignupTitle',
      desc: '',
      args: [],
    );
  }

  /// `الخطوة 1 من 3 — البيانات الشخصية`
  String get specSignupStep1Label {
    return Intl.message(
      'الخطوة 1 من 3 — البيانات الشخصية',
      name: 'specSignupStep1Label',
      desc: '',
      args: [],
    );
  }

  /// `الاسم الكامل`
  String get specSignupFullName {
    return Intl.message(
      'الاسم الكامل',
      name: 'specSignupFullName',
      desc: '',
      args: [],
    );
  }

  /// `مثال: خالد ياسين`
  String get specSignupFullNameHint {
    return Intl.message(
      'مثال: خالد ياسين',
      name: 'specSignupFullNameHint',
      desc: '',
      args: [],
    );
  }

  /// `المدينة / المنطقة`
  String get specSignupCity {
    return Intl.message(
      'المدينة / المنطقة',
      name: 'specSignupCity',
      desc: '',
      args: [],
    );
  }

  /// `مثال: جونية`
  String get specSignupCityHint {
    return Intl.message(
      'مثال: جونية',
      name: 'specSignupCityHint',
      desc: '',
      args: [],
    );
  }

  /// `هذا الحقل مطلوب`
  String get specSignupFieldRequired {
    return Intl.message(
      'هذا الحقل مطلوب',
      name: 'specSignupFieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `الخطوة 2 من 3 — فئة الخدمة`
  String get specSignupStep2Label {
    return Intl.message(
      'الخطوة 2 من 3 — فئة الخدمة',
      name: 'specSignupStep2Label',
      desc: '',
      args: [],
    );
  }

  /// `فئة الخدمة`
  String get specSignupCategoryLabel {
    return Intl.message(
      'فئة الخدمة',
      name: 'specSignupCategoryLabel',
      desc: '',
      args: [],
    );
  }

  /// `مثال: سباكة، كهرباء، تنظيف`
  String get specSignupCategoryHint {
    return Intl.message(
      'مثال: سباكة، كهرباء، تنظيف',
      name: 'specSignupCategoryHint',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء اختيار فئة تخصصك`
  String get specSignupCategoryRequired {
    return Intl.message(
      'الرجاء اختيار فئة تخصصك',
      name: 'specSignupCategoryRequired',
      desc: '',
      args: [],
    );
  }

  /// `الخطوة 3 من 3 — الخبرة`
  String get specSignupStep3Label {
    return Intl.message(
      'الخطوة 3 من 3 — الخبرة',
      name: 'specSignupStep3Label',
      desc: '',
      args: [],
    );
  }

  /// `سنوات الخبرة`
  String get specSignupExperienceYears {
    return Intl.message(
      'سنوات الخبرة',
      name: 'specSignupExperienceYears',
      desc: '',
      args: [],
    );
  }

  /// `نبذة قصيرة عنك`
  String get specSignupBioLabel {
    return Intl.message(
      'نبذة قصيرة عنك',
      name: 'specSignupBioLabel',
      desc: '',
      args: [],
    );
  }

  /// `اكتب جملة أو جملتين عن خبرتك...`
  String get specSignupBioHint {
    return Intl.message(
      'اكتب جملة أو جملتين عن خبرتك...',
      name: 'specSignupBioHint',
      desc: '',
      args: [],
    );
  }

  /// `السابق`
  String get specSignupBack {
    return Intl.message('السابق', name: 'specSignupBack', desc: '', args: []);
  }

  /// `التالي`
  String get specSignupNext {
    return Intl.message('التالي', name: 'specSignupNext', desc: '', args: []);
  }

  /// `إرسال`
  String get specSignupSubmit {
    return Intl.message('إرسال', name: 'specSignupSubmit', desc: '', args: []);
  }

  /// `أقل من سنة`
  String get expUnderOneYear {
    return Intl.message(
      'أقل من سنة',
      name: 'expUnderOneYear',
      desc: '',
      args: [],
    );
  }

  /// `1-3 سنوات`
  String get exp1To3Years {
    return Intl.message('1-3 سنوات', name: 'exp1To3Years', desc: '', args: []);
  }

  /// `3-10 سنوات`
  String get exp3To10Years {
    return Intl.message(
      '3-10 سنوات',
      name: 'exp3To10Years',
      desc: '',
      args: [],
    );
  }

  /// `أكثر من 10`
  String get expOver10Years {
    return Intl.message(
      'أكثر من 10',
      name: 'expOver10Years',
      desc: '',
      args: [],
    );
  }

  /// `توثيق الحساب`
  String get docUploadTitle {
    return Intl.message(
      'توثيق الحساب',
      name: 'docUploadTitle',
      desc: '',
      args: [],
    );
  }

  /// `ارفع المستندات التالية للتأكد من هويتك. سيراجعها فريقنا خلال 24-48 ساعة.`
  String get docUploadIntro {
    return Intl.message(
      'ارفع المستندات التالية للتأكد من هويتك. سيراجعها فريقنا خلال 24-48 ساعة.',
      name: 'docUploadIntro',
      desc: '',
      args: [],
    );
  }

  /// `تم الرفع ✓`
  String get docUploadDone {
    return Intl.message(
      'تم الرفع ✓',
      name: 'docUploadDone',
      desc: '',
      args: [],
    );
  }

  /// `التقاط صورة`
  String get docUploadTakePhoto {
    return Intl.message(
      'التقاط صورة',
      name: 'docUploadTakePhoto',
      desc: '',
      args: [],
    );
  }

  /// `رفع من المعرض`
  String get docUploadFromGallery {
    return Intl.message(
      'رفع من المعرض',
      name: 'docUploadFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `إرسال للمراجعة`
  String get docUploadSubmit {
    return Intl.message(
      'إرسال للمراجعة',
      name: 'docUploadSubmit',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء إرفاق بطاقة الهوية وصورة السيلفي للمتابعة`
  String get docUploadRequiredError {
    return Intl.message(
      'الرجاء إرفاق بطاقة الهوية وصورة السيلفي للمتابعة',
      name: 'docUploadRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `تم إرسال بياناتك بنجاح، وهي الآن قيد المراجعة`
  String get specSignupSubmitSuccess {
    return Intl.message(
      'تم إرسال بياناتك بنجاح، وهي الآن قيد المراجعة',
      name: 'specSignupSubmitSuccess',
      desc: '',
      args: [],
    );
  }

  /// `بطاقة الهوية`
  String get docIdLabel {
    return Intl.message('بطاقة الهوية', name: 'docIdLabel', desc: '', args: []);
  }

  /// `صورة سيلفي`
  String get docSelfieLabel {
    return Intl.message(
      'صورة سيلفي',
      name: 'docSelfieLabel',
      desc: '',
      args: [],
    );
  }

  /// `الشهادات المهنية`
  String get docCertLabel {
    return Intl.message(
      'الشهادات المهنية',
      name: 'docCertLabel',
      desc: '',
      args: [],
    );
  }

  /// `نماذج من أعمالك`
  String get docSampleLabel {
    return Intl.message(
      'نماذج من أعمالك',
      name: 'docSampleLabel',
      desc: '',
      args: [],
    );
  }

  /// `طلبك قيد المراجعة`
  String get pendingTitle {
    return Intl.message(
      'طلبك قيد المراجعة',
      name: 'pendingTitle',
      desc: '',
      args: [],
    );
  }

  /// `شكراً لتسجيلك! يقوم فريقنا الآن بمراجعة مستنداتك، وسنُعلمك بالنتيجة خلال 24-48 ساعة عبر إشعار في التطبيق.`
  String get pendingBody {
    return Intl.message(
      'شكراً لتسجيلك! يقوم فريقنا الآن بمراجعة مستنداتك، وسنُعلمك بالنتيجة خلال 24-48 ساعة عبر إشعار في التطبيق.',
      name: 'pendingBody',
      desc: '',
      args: [],
    );
  }

  /// `حالة الطلب`
  String get pendingStatusTitle {
    return Intl.message(
      'حالة الطلب',
      name: 'pendingStatusTitle',
      desc: '',
      args: [],
    );
  }

  /// `قيد المراجعة`
  String get pendingStatusBadge {
    return Intl.message(
      'قيد المراجعة',
      name: 'pendingStatusBadge',
      desc: '',
      args: [],
    );
  }

  /// `التحقق من الحالة (للعرض التجريبي)`
  String get pendingCheckDemo {
    return Intl.message(
      'التحقق من الحالة (للعرض التجريبي)',
      name: 'pendingCheckDemo',
      desc: '',
      args: [],
    );
  }

  /// `تهانينا! تمت الموافقة على حسابك`
  String get approvedTitle {
    return Intl.message(
      'تهانينا! تمت الموافقة على حسابك',
      name: 'approvedTitle',
      desc: '',
      args: [],
    );
  }

  /// `أصبح بإمكانك الآن استكمال ملفك الشخصي وبدء استقبال طلبات الحجز من العملاء.`
  String get approvedBody {
    return Intl.message(
      'أصبح بإمكانك الآن استكمال ملفك الشخصي وبدء استقبال طلبات الحجز من العملاء.',
      name: 'approvedBody',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء ملفي الشخصي`
  String get approvedCreateProfile {
    return Intl.message(
      'إنشاء ملفي الشخصي',
      name: 'approvedCreateProfile',
      desc: '',
      args: [],
    );
  }

  /// `إعداد الملف الشخصي`
  String get profileEditTitle {
    return Intl.message(
      'إعداد الملف الشخصي',
      name: 'profileEditTitle',
      desc: '',
      args: [],
    );
  }

  /// `صورتك الشخصية`
  String get profileEditAvatarPlaceholder {
    return Intl.message(
      'صورتك الشخصية',
      name: 'profileEditAvatarPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `نطاق السعر (بالدولار)`
  String get profileEditPriceRangeLabel {
    return Intl.message(
      'نطاق السعر (بالدولار)',
      name: 'profileEditPriceRangeLabel',
      desc: '',
      args: [],
    );
  }

  /// `من`
  String get profileEditPriceFrom {
    return Intl.message('من', name: 'profileEditPriceFrom', desc: '', args: []);
  }

  /// `إلى`
  String get profileEditPriceTo {
    return Intl.message('إلى', name: 'profileEditPriceTo', desc: '', args: []);
  }

  /// `أيام التوفر`
  String get profileEditAvailabilityLabel {
    return Intl.message(
      'أيام التوفر',
      name: 'profileEditAvailabilityLabel',
      desc: '',
      args: [],
    );
  }

  /// `حفظ ومتابعة`
  String get profileEditSave {
    return Intl.message(
      'حفظ ومتابعة',
      name: 'profileEditSave',
      desc: '',
      args: [],
    );
  }

  /// `مرحباً بعودتك`
  String get specInboxGreeting {
    return Intl.message(
      'مرحباً بعودتك',
      name: 'specInboxGreeting',
      desc: '',
      args: [],
    );
  }

  /// `طلبات الحجز`
  String get specInboxTitle {
    return Intl.message(
      'طلبات الحجز',
      name: 'specInboxTitle',
      desc: '',
      args: [],
    );
  }

  /// `إلغاء`
  String get specInboxDecline {
    return Intl.message('إلغاء', name: 'specInboxDecline', desc: '', args: []);
  }

  /// `قبول`
  String get specInboxAccept {
    return Intl.message('قبول', name: 'specInboxAccept', desc: '', args: []);
  }

  /// `بدء التنفيذ`
  String get specInboxStart {
    return Intl.message(
      'بدء التنفيذ',
      name: 'specInboxStart',
      desc: '',
      args: [],
    );
  }

  /// `إنهاء`
  String get specInboxComplete {
    return Intl.message('إنهاء', name: 'specInboxComplete', desc: '', args: []);
  }

  /// `لا توجد حجوزات لك`
  String get specInboxEmpty {
    return Intl.message(
      'لا توجد حجوزات لك',
      name: 'specInboxEmpty',
      desc: '',
      args: [],
    );
  }

  /// `اليوم`
  String get specInboxDateToday {
    return Intl.message(
      'اليوم',
      name: 'specInboxDateToday',
      desc: '',
      args: [],
    );
  }

  /// `غداً`
  String get specInboxDateTomorrow {
    return Intl.message(
      'غداً',
      name: 'specInboxDateTomorrow',
      desc: '',
      args: [],
    );
  }

  /// `تفاصيل المهمة`
  String get jobDetailTitle {
    return Intl.message(
      'تفاصيل المهمة',
      name: 'jobDetailTitle',
      desc: '',
      args: [],
    );
  }

  /// `الموعد`
  String get jobDetailAppointmentLabel {
    return Intl.message(
      'الموعد',
      name: 'jobDetailAppointmentLabel',
      desc: '',
      args: [],
    );
  }

  /// `العنوان`
  String get jobDetailAddressLabel {
    return Intl.message(
      'العنوان',
      name: 'jobDetailAddressLabel',
      desc: '',
      args: [],
    );
  }

  /// `الحالة`
  String get jobDetailStatusLabel {
    return Intl.message(
      'الحالة',
      name: 'jobDetailStatusLabel',
      desc: '',
      args: [],
    );
  }

  /// `تحديد كمكتمل`
  String get jobDetailComplete {
    return Intl.message(
      'تحديد كمكتمل',
      name: 'jobDetailComplete',
      desc: '',
      args: [],
    );
  }

  /// `قيد التنفيذ`
  String get jobStatusInProgress {
    return Intl.message(
      'قيد التنفيذ',
      name: 'jobStatusInProgress',
      desc: '',
      args: [],
    );
  }

  /// `مقبول`
  String get jobStatusAccepted {
    return Intl.message('مقبول', name: 'jobStatusAccepted', desc: '', args: []);
  }

  /// `الأرباح`
  String get earningsTitle {
    return Intl.message('الأرباح', name: 'earningsTitle', desc: '', args: []);
  }

  /// `اليوم`
  String get earningsToday {
    return Intl.message('اليوم', name: 'earningsToday', desc: '', args: []);
  }

  /// `هذا الأسبوع`
  String get earningsThisWeek {
    return Intl.message(
      'هذا الأسبوع',
      name: 'earningsThisWeek',
      desc: '',
      args: [],
    );
  }

  /// `الإجمالي`
  String get earningsTotal {
    return Intl.message('الإجمالي', name: 'earningsTotal', desc: '', args: []);
  }

  /// `آخر المهام المكتملة`
  String get earningsRecentJobsTitle {
    return Intl.message(
      'آخر المهام المكتملة',
      name: 'earningsRecentJobsTitle',
      desc: '',
      args: [],
    );
  }

  /// `موثّق ✓`
  String get specSettingsVerified {
    return Intl.message(
      'موثّق ✓',
      name: 'specSettingsVerified',
      desc: '',
      args: [],
    );
  }

  /// `دخول المسؤول`
  String get adminLoginTitle {
    return Intl.message(
      'دخول المسؤول',
      name: 'adminLoginTitle',
      desc: '',
      args: [],
    );
  }

  /// `دخول مخصص لفريق إدارة المنصة`
  String get adminLoginSubtitle {
    return Intl.message(
      'دخول مخصص لفريق إدارة المنصة',
      name: 'adminLoginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `اسم المستخدم`
  String get adminLoginUsernameHint {
    return Intl.message(
      'اسم المستخدم',
      name: 'adminLoginUsernameHint',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get adminLoginPasswordHint {
    return Intl.message(
      'كلمة المرور',
      name: 'adminLoginPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `دخول`
  String get adminLoginSubmit {
    return Intl.message('دخول', name: 'adminLoginSubmit', desc: '', args: []);
  }

  /// `لوحة التحكم`
  String get adminDashboardEyebrow {
    return Intl.message(
      'لوحة التحكم',
      name: 'adminDashboardEyebrow',
      desc: '',
      args: [],
    );
  }

  /// `نظرة عامة`
  String get adminDashboardTitle {
    return Intl.message(
      'نظرة عامة',
      name: 'adminDashboardTitle',
      desc: '',
      args: [],
    );
  }

  /// `خروج`
  String get adminDashboardLogout {
    return Intl.message(
      'خروج',
      name: 'adminDashboardLogout',
      desc: '',
      args: [],
    );
  }

  /// `طلبات معلّقة`
  String get adminStatPending {
    return Intl.message(
      'طلبات معلّقة',
      name: 'adminStatPending',
      desc: '',
      args: [],
    );
  }

  /// `أخصائيون نشطون`
  String get adminStatActiveSpecialists {
    return Intl.message(
      'أخصائيون نشطون',
      name: 'adminStatActiveSpecialists',
      desc: '',
      args: [],
    );
  }

  /// `حجوزات هذا الشهر`
  String get adminStatMonthlyBookings {
    return Intl.message(
      'حجوزات هذا الشهر',
      name: 'adminStatMonthlyBookings',
      desc: '',
      args: [],
    );
  }

  /// `إيرادات الشهر`
  String get adminStatMonthlyRevenue {
    return Intl.message(
      'إيرادات الشهر',
      name: 'adminStatMonthlyRevenue',
      desc: '',
      args: [],
    );
  }

  /// `مراجعة طلبات الأخصائيين`
  String get adminReviewAppsTitle {
    return Intl.message(
      'مراجعة طلبات الأخصائيين',
      name: 'adminReviewAppsTitle',
      desc: '',
      args: [],
    );
  }

  /// `{count} طلبات بانتظار المراجعة`
  String adminReviewAppsSubtitle(int count) {
    return Intl.message(
      '$count طلبات بانتظار المراجعة',
      name: 'adminReviewAppsSubtitle',
      desc: '',
      args: [count],
    );
  }

  /// `إدارة المنصة`
  String get adminManageTitle {
    return Intl.message(
      'إدارة المنصة',
      name: 'adminManageTitle',
      desc: '',
      args: [],
    );
  }

  /// `الفئات، البلاغات، المستخدمون`
  String get adminManageSubtitle {
    return Intl.message(
      'الفئات، البلاغات، المستخدمون',
      name: 'adminManageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `مراجعة الطلبات`
  String get adminReviewTitle {
    return Intl.message(
      'مراجعة الطلبات',
      name: 'adminReviewTitle',
      desc: '',
      args: [],
    );
  }

  /// `بطاقة الهوية`
  String get adminReviewIdCard {
    return Intl.message(
      'بطاقة الهوية',
      name: 'adminReviewIdCard',
      desc: '',
      args: [],
    );
  }

  /// `الشهادات`
  String get adminReviewCertificates {
    return Intl.message(
      'الشهادات',
      name: 'adminReviewCertificates',
      desc: '',
      args: [],
    );
  }

  /// `سبب الرفض (يظهر فقط عند الرفض)`
  String get adminReviewRejectReasonHint {
    return Intl.message(
      'سبب الرفض (يظهر فقط عند الرفض)',
      name: 'adminReviewRejectReasonHint',
      desc: '',
      args: [],
    );
  }

  /// `رفض`
  String get adminReviewReject {
    return Intl.message('رفض', name: 'adminReviewReject', desc: '', args: []);
  }

  /// `قبول`
  String get adminReviewApprove {
    return Intl.message('قبول', name: 'adminReviewApprove', desc: '', args: []);
  }

  /// `قيد المراجعة`
  String get adminAppPendingBadge {
    return Intl.message(
      'قيد المراجعة',
      name: 'adminAppPendingBadge',
      desc: '',
      args: [],
    );
  }

  /// `تمت الموافقة`
  String get adminAppApprovedBadge {
    return Intl.message(
      'تمت الموافقة',
      name: 'adminAppApprovedBadge',
      desc: '',
      args: [],
    );
  }

  /// `إدارة المنصة`
  String get adminManagePlatformTitle {
    return Intl.message(
      'إدارة المنصة',
      name: 'adminManagePlatformTitle',
      desc: '',
      args: [],
    );
  }

  /// `الفئات`
  String get adminTabCategories {
    return Intl.message(
      'الفئات',
      name: 'adminTabCategories',
      desc: '',
      args: [],
    );
  }

  /// `البلاغات`
  String get adminTabReports {
    return Intl.message(
      'البلاغات',
      name: 'adminTabReports',
      desc: '',
      args: [],
    );
  }

  /// `المستخدمون`
  String get adminTabUsers {
    return Intl.message(
      'المستخدمون',
      name: 'adminTabUsers',
      desc: '',
      args: [],
    );
  }

  /// `الإشعارات`
  String get notificationsTitle {
    return Intl.message(
      'الإشعارات',
      name: 'notificationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `المساعدة والدعم`
  String get helpTitle {
    return Intl.message(
      'المساعدة والدعم',
      name: 'helpTitle',
      desc: '',
      args: [],
    );
  }

  /// `تواصل معنا مباشرة`
  String get helpContactUs {
    return Intl.message(
      'تواصل معنا مباشرة',
      name: 'helpContactUs',
      desc: '',
      args: [],
    );
  }

  /// `كيف أحجز موعداً مع أخصائي؟`
  String get faq1Question {
    return Intl.message(
      'كيف أحجز موعداً مع أخصائي؟',
      name: 'faq1Question',
      desc: '',
      args: [],
    );
  }

  /// `اختر الأخصائي من نتائج البحث، ثم اضغط "احجز الآن" واختر الوقت المناسب لك.`
  String get faq1Answer {
    return Intl.message(
      'اختر الأخصائي من نتائج البحث، ثم اضغط "احجز الآن" واختر الوقت المناسب لك.',
      name: 'faq1Answer',
      desc: '',
      args: [],
    );
  }

  /// `كيف يتم الدفع؟`
  String get faq2Question {
    return Intl.message(
      'كيف يتم الدفع؟',
      name: 'faq2Question',
      desc: '',
      args: [],
    );
  }

  /// `يتم الاتفاق على السعر مباشرة مع الأخصائي، والدفع نقداً عند إنجاز الخدمة.`
  String get faq2Answer {
    return Intl.message(
      'يتم الاتفاق على السعر مباشرة مع الأخصائي، والدفع نقداً عند إنجاز الخدمة.',
      name: 'faq2Answer',
      desc: '',
      args: [],
    );
  }

  /// `كيف أصبح أخصائياً على المنصة؟`
  String get faq3Question {
    return Intl.message(
      'كيف أصبح أخصائياً على المنصة؟',
      name: 'faq3Question',
      desc: '',
      args: [],
    );
  }

  /// `اختر "أنا أخصائي" عند التسجيل، وأكمل خطوات التوثيق ورفع المستندات.`
  String get faq3Answer {
    return Intl.message(
      'اختر "أنا أخصائي" عند التسجيل، وأكمل خطوات التوثيق ورفع المستندات.',
      name: 'faq3Answer',
      desc: '',
      args: [],
    );
  }

  /// `الإعدادات`
  String get settingsTitle {
    return Intl.message('الإعدادات', name: 'settingsTitle', desc: '', args: []);
  }

  /// `حجم الخط`
  String get settingsFontSizeLabel {
    return Intl.message(
      'حجم الخط',
      name: 'settingsFontSizeLabel',
      desc: '',
      args: [],
    );
  }

  /// `أ`
  String get settingsFontSizePreview {
    return Intl.message(
      'أ',
      name: 'settingsFontSizePreview',
      desc: '',
      args: [],
    );
  }

  /// `لغة التطبيق`
  String get settingsLanguageLabel {
    return Intl.message(
      'لغة التطبيق',
      name: 'settingsLanguageLabel',
      desc: '',
      args: [],
    );
  }

  /// `العربية (الوحيدة حالياً)`
  String get settingsLanguageValue {
    return Intl.message(
      'العربية (الوحيدة حالياً)',
      name: 'settingsLanguageValue',
      desc: '',
      args: [],
    );
  }

  /// `إشعارات الحجوزات`
  String get settingsBookingNotifications {
    return Intl.message(
      'إشعارات الحجوزات',
      name: 'settingsBookingNotifications',
      desc: '',
      args: [],
    );
  }

  /// `إشعارات الرسائل`
  String get settingsMessageNotifications {
    return Intl.message(
      'إشعارات الرسائل',
      name: 'settingsMessageNotifications',
      desc: '',
      args: [],
    );
  }

  /// `ميكانيكي`
  String get catMechanic {
    return Intl.message('ميكانيكي', name: 'catMechanic', desc: '', args: []);
  }

  /// `كهربائي`
  String get catElectrician {
    return Intl.message('كهربائي', name: 'catElectrician', desc: '', args: []);
  }

  /// `سباك`
  String get catPlumber {
    return Intl.message('سباك', name: 'catPlumber', desc: '', args: []);
  }

  /// `مدرّس`
  String get catTutor {
    return Intl.message('مدرّس', name: 'catTutor', desc: '', args: []);
  }

  /// `نجار`
  String get catCarpenter {
    return Intl.message('نجار', name: 'catCarpenter', desc: '', args: []);
  }

  /// `دهان`
  String get catPainter {
    return Intl.message('دهان', name: 'catPainter', desc: '', args: []);
  }

  /// `تنظيف `
  String get catCleaning {
    return Intl.message('تنظيف ', name: 'catCleaning', desc: '', args: []);
  }

  /// `تكييف وتبريد`
  String get catAc {
    return Intl.message('تكييف وتبريد', name: 'catAc', desc: '', args: []);
  }

  /// `معلّم باطون`
  String get catConcreteWorker {
    return Intl.message(
      'معلّم باطون',
      name: 'catConcreteWorker',
      desc: '',
      args: [],
    );
  }

  /// `طيّان`
  String get catPlasterer {
    return Intl.message('طيّان', name: 'catPlasterer', desc: '', args: []);
  }

  /// `بلّيط`
  String get catTiler {
    return Intl.message('بلّيط', name: 'catTiler', desc: '', args: []);
  }

  /// `حجّار`
  String get catStonemason {
    return Intl.message('حجّار', name: 'catStonemason', desc: '', args: []);
  }

  /// `مسلّح حديد`
  String get catRebarWorker {
    return Intl.message(
      'مسلّح حديد',
      name: 'catRebarWorker',
      desc: '',
      args: [],
    );
  }

  /// `مقاول`
  String get catContractor {
    return Intl.message('مقاول', name: 'catContractor', desc: '', args: []);
  }

  /// `جبّاس (ديكور جبس)`
  String get catGypsumWorker {
    return Intl.message(
      'جبّاس (ديكور جبس)',
      name: 'catGypsumWorker',
      desc: '',
      args: [],
    );
  }

  /// `عازل مائي وحراري`
  String get catInsulationWorker {
    return Intl.message(
      'عازل مائي وحراري',
      name: 'catInsulationWorker',
      desc: '',
      args: [],
    );
  }

  /// `حدّاد`
  String get catBlacksmith {
    return Intl.message('حدّاد', name: 'catBlacksmith', desc: '', args: []);
  }

  /// `ألمنيوم`
  String get catAluminumInstaller {
    return Intl.message(
      'ألمنيوم',
      name: 'catAluminumInstaller',
      desc: '',
      args: [],
    );
  }

  /// `زجّاج`
  String get catGlazier {
    return Intl.message('زجّاج', name: 'catGlazier', desc: '', args: []);
  }

  /// `تركيب سخانات شمسية`
  String get catSolarWaterHeaterInstaller {
    return Intl.message(
      'تركيب سخانات شمسية',
      name: 'catSolarWaterHeaterInstaller',
      desc: '',
      args: [],
    );
  }

  /// `صيانة مولدات`
  String get catGeneratorTechnician {
    return Intl.message(
      'صيانة مولدات',
      name: 'catGeneratorTechnician',
      desc: '',
      args: [],
    );
  }

  /// `طاقة شمسية`
  String get catSolarPanelInstaller {
    return Intl.message(
      'طاقة شمسية',
      name: 'catSolarPanelInstaller',
      desc: '',
      args: [],
    );
  }

  /// `تبريد وتكييف`
  String get catHvacTechnician {
    return Intl.message(
      'تبريد وتكييف',
      name: 'catHvacTechnician',
      desc: '',
      args: [],
    );
  }

  /// `تصليح أدوات كهربائية منزلية`
  String get catApplianceRepair {
    return Intl.message(
      'تصليح أدوات كهربائية منزلية',
      name: 'catApplianceRepair',
      desc: '',
      args: [],
    );
  }

  /// `دش وكاميرات مراقبة`
  String get catSatelliteAndCctvInstaller {
    return Intl.message(
      'دش وكاميرات مراقبة',
      name: 'catSatelliteAndCctvInstaller',
      desc: '',
      args: [],
    );
  }

  /// `إنترنت وشبكات`
  String get catNetworkTechnician {
    return Intl.message(
      'إنترنت وشبكات',
      name: 'catNetworkTechnician',
      desc: '',
      args: [],
    );
  }

  /// `تصليح خلوي وكمبيوتر`
  String get catPhoneAndPcRepair {
    return Intl.message(
      'تصليح خلوي وكمبيوتر',
      name: 'catPhoneAndPcRepair',
      desc: '',
      args: [],
    );
  }

  /// `كهربائي سيارات`
  String get catAutoElectrician {
    return Intl.message(
      'كهربائي سيارات',
      name: 'catAutoElectrician',
      desc: '',
      args: [],
    );
  }

  /// `حدادة سيارات`
  String get catAutoBodyRepair {
    return Intl.message(
      'حدادة سيارات',
      name: 'catAutoBodyRepair',
      desc: '',
      args: [],
    );
  }

  /// `دهان سيارات`
  String get catAutoPainter {
    return Intl.message(
      'دهان سيارات',
      name: 'catAutoPainter',
      desc: '',
      args: [],
    );
  }

  /// `بنشرجي`
  String get catTireRepair {
    return Intl.message('بنشرجي', name: 'catTireRepair', desc: '', args: []);
  }

  /// `غسيل سيارات`
  String get catCarWash {
    return Intl.message('غسيل سيارات', name: 'catCarWash', desc: '', args: []);
  }

  /// `ونش سحب سيارات`
  String get catTowingService {
    return Intl.message(
      'ونش سحب سيارات',
      name: 'catTowingService',
      desc: '',
      args: [],
    );
  }

  /// `نقليات وسائق فان`
  String get catDriverTransport {
    return Intl.message(
      'نقليات وسائق فان',
      name: 'catDriverTransport',
      desc: '',
      args: [],
    );
  }

  /// `حفريات وجرافة`
  String get catExcavationOperator {
    return Intl.message(
      'حفريات وجرافة',
      name: 'catExcavationOperator',
      desc: '',
      args: [],
    );
  }

  /// `مزارع`
  String get catFarmer {
    return Intl.message('مزارع', name: 'catFarmer', desc: '', args: []);
  }

  /// `تشحيل وتقليم`
  String get catTreePruning {
    return Intl.message(
      'تشحيل وتقليم',
      name: 'catTreePruning',
      desc: '',
      args: [],
    );
  }

  /// `فلاحة أرض`
  String get catLandPlowing {
    return Intl.message(
      'فلاحة أرض',
      name: 'catLandPlowing',
      desc: '',
      args: [],
    );
  }

  /// `رش مبيدات`
  String get catPesticideSpraying {
    return Intl.message(
      'رش مبيدات',
      name: 'catPesticideSpraying',
      desc: '',
      args: [],
    );
  }

  /// `شبكات ريّ`
  String get catIrrigationInstaller {
    return Intl.message(
      'شبكات ريّ',
      name: 'catIrrigationInstaller',
      desc: '',
      args: [],
    );
  }

  /// `نحّال`
  String get catBeekeeper {
    return Intl.message('نحّال', name: 'catBeekeeper', desc: '', args: []);
  }

  /// `تربية مواشي ودواجن`
  String get catLivestockBreeder {
    return Intl.message(
      'تربية مواشي ودواجن',
      name: 'catLivestockBreeder',
      desc: '',
      args: [],
    );
  }

  /// `تنسيق حدائق`
  String get catGardener {
    return Intl.message('تنسيق حدائق', name: 'catGardener', desc: '', args: []);
  }

  /// `تنظيف أراضي وقص عشب`
  String get catLandClearing {
    return Intl.message(
      'تنظيف أراضي وقص عشب',
      name: 'catLandClearing',
      desc: '',
      args: [],
    );
  }

  /// `بيع حطب`
  String get catFirewoodSupplier {
    return Intl.message(
      'بيع حطب',
      name: 'catFirewoodSupplier',
      desc: '',
      args: [],
    );
  }

  /// `فرّان`
  String get catBaker {
    return Intl.message('فرّان', name: 'catBaker', desc: '', args: []);
  }

  /// `سناك وفلافل`
  String get catSnackChef {
    return Intl.message(
      'سناك وفلافل',
      name: 'catSnackChef',
      desc: '',
      args: [],
    );
  }

  /// `لحّام`
  String get catButcher {
    return Intl.message('لحّام', name: 'catButcher', desc: '', args: []);
  }

  /// `صناعة مونة`
  String get catMounehMaker {
    return Intl.message(
      'صناعة مونة',
      name: 'catMounehMaker',
      desc: '',
      args: [],
    );
  }

  /// `ألبان وأجبان`
  String get catDairyMaker {
    return Intl.message(
      'ألبان وأجبان',
      name: 'catDairyMaker',
      desc: '',
      args: [],
    );
  }

  /// `معصرة زيتون`
  String get catOliveOilPress {
    return Intl.message(
      'معصرة زيتون',
      name: 'catOliveOilPress',
      desc: '',
      args: [],
    );
  }

  /// `طبخ ومناسبات`
  String get catCaterer {
    return Intl.message('طبخ ومناسبات', name: 'catCaterer', desc: '', args: []);
  }

  /// `حلونجي`
  String get catSweetsMaker {
    return Intl.message('حلونجي', name: 'catSweetsMaker', desc: '', args: []);
  }

  /// `حلّاق رجالي`
  String get catMenBarber {
    return Intl.message(
      'حلّاق رجالي',
      name: 'catMenBarber',
      desc: '',
      args: [],
    );
  }

  /// `كوافيرة نسائية`
  String get catWomenHairdresser {
    return Intl.message(
      'كوافيرة نسائية',
      name: 'catWomenHairdresser',
      desc: '',
      args: [],
    );
  }

  /// `خيّاط`
  String get catTailor {
    return Intl.message('خيّاط', name: 'catTailor', desc: '', args: []);
  }

  /// `تنظيف منازل`
  String get catHouseCleaning {
    return Intl.message(
      'تنظيف منازل',
      name: 'catHouseCleaning',
      desc: '',
      args: [],
    );
  }

  /// `تنظيف خزانات`
  String get catWaterTankCleaning {
    return Intl.message(
      'تنظيف خزانات',
      name: 'catWaterTankCleaning',
      desc: '',
      args: [],
    );
  }

  /// `مكافحة حشرات`
  String get catPestControl {
    return Intl.message(
      'مكافحة حشرات',
      name: 'catPestControl',
      desc: '',
      args: [],
    );
  }

  /// `نقل عفش`
  String get catFurnitureMoving {
    return Intl.message(
      'نقل عفش',
      name: 'catFurnitureMoving',
      desc: '',
      args: [],
    );
  }

  /// `توصيل مياه`
  String get catWaterDelivery {
    return Intl.message(
      'توصيل مياه',
      name: 'catWaterDelivery',
      desc: '',
      args: [],
    );
  }

  /// `توصيل غاز`
  String get catGasDelivery {
    return Intl.message(
      'توصيل غاز',
      name: 'catGasDelivery',
      desc: '',
      args: [],
    );
  }

  /// `دليفري`
  String get catDeliveryService {
    return Intl.message(
      'دليفري',
      name: 'catDeliveryService',
      desc: '',
      args: [],
    );
  }

  /// `مصوّر مناسبات`
  String get catPhotographer {
    return Intl.message(
      'مصوّر مناسبات',
      name: 'catPhotographer',
      desc: '',
      args: [],
    );
  }

  /// `دي جي وزفّة`
  String get catDjAndZaffe {
    return Intl.message(
      'دي جي وزفّة',
      name: 'catDjAndZaffe',
      desc: '',
      args: [],
    );
  }

  /// `تعليم خصوصي`
  String get catPrivateTutor {
    return Intl.message(
      'تعليم خصوصي',
      name: 'catPrivateTutor',
      desc: '',
      args: [],
    );
  }

  /// `مدرّب رياضي`
  String get catFitnessTrainer {
    return Intl.message(
      'مدرّب رياضي',
      name: 'catFitnessTrainer',
      desc: '',
      args: [],
    );
  }

  /// `تمريض منزلي`
  String get catHomeNurse {
    return Intl.message(
      'تمريض منزلي',
      name: 'catHomeNurse',
      desc: '',
      args: [],
    );
  }

  /// `تعهدات أفراح وعزاء`
  String get catEventEquipmentRental {
    return Intl.message(
      'تعهدات أفراح وعزاء',
      name: 'catEventEquipmentRental',
      desc: '',
      args: [],
    );
  }

  /// `ساعاتي`
  String get catWatchRepair {
    return Intl.message('ساعاتي', name: 'catWatchRepair', desc: '', args: []);
  }

  /// `كندرجي`
  String get catShoeRepair {
    return Intl.message('كندرجي', name: 'catShoeRepair', desc: '', args: []);
  }

  /// `بائع خضرة متجوّل`
  String get catMobileVegetableVendor {
    return Intl.message(
      'بائع خضرة متجوّل',
      name: 'catMobileVegetableVendor',
      desc: '',
      args: [],
    );
  }

  /// `أحد`
  String get dayNameSunday {
    return Intl.message('أحد', name: 'dayNameSunday', desc: '', args: []);
  }

  /// `اثنين`
  String get dayNameMonday {
    return Intl.message('اثنين', name: 'dayNameMonday', desc: '', args: []);
  }

  /// `ثلاثاء`
  String get dayNameTuesday {
    return Intl.message('ثلاثاء', name: 'dayNameTuesday', desc: '', args: []);
  }

  /// `أربعاء`
  String get dayNameWednesday {
    return Intl.message('أربعاء', name: 'dayNameWednesday', desc: '', args: []);
  }

  /// `خميس`
  String get dayNameThursday {
    return Intl.message('خميس', name: 'dayNameThursday', desc: '', args: []);
  }

  /// `جمعة`
  String get dayNameFriday {
    return Intl.message('جمعة', name: 'dayNameFriday', desc: '', args: []);
  }

  /// `سبت`
  String get dayNameSaturday {
    return Intl.message('سبت', name: 'dayNameSaturday', desc: '', args: []);
  }

  /// `الرئيسية`
  String get navHome {
    return Intl.message('الرئيسية', name: 'navHome', desc: '', args: []);
  }

  /// `الحجوزات`
  String get navBookings {
    return Intl.message('الحجوزات', name: 'navBookings', desc: '', args: []);
  }

  /// `الملف الشخصي`
  String get navProfile {
    return Intl.message('الملف الشخصي', name: 'navProfile', desc: '', args: []);
  }

  /// `لا يوجد أخصائيون في هذه الفئة حالياً`
  String get categoryResultEmpty {
    return Intl.message(
      'لا يوجد أخصائيون في هذه الفئة حالياً',
      name: 'categoryResultEmpty',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ أثناء تحميل الأخصائيين`
  String get categoryResultError {
    return Intl.message(
      'حدث خطأ أثناء تحميل الأخصائيين',
      name: 'categoryResultError',
      desc: '',
      args: [],
    );
  }

  /// `بانتظار الرد`
  String get bookingStatusPending {
    return Intl.message(
      'بانتظار الرد',
      name: 'bookingStatusPending',
      desc: '',
      args: [],
    );
  }

  /// `مقبول`
  String get bookingStatusAccepted {
    return Intl.message(
      'مقبول',
      name: 'bookingStatusAccepted',
      desc: '',
      args: [],
    );
  }

  /// `قيد التنفيذ`
  String get bookingStatusInProgress {
    return Intl.message(
      'قيد التنفيذ',
      name: 'bookingStatusInProgress',
      desc: '',
      args: [],
    );
  }

  /// `مكتمل`
  String get bookingStatusCompleted {
    return Intl.message(
      'مكتمل',
      name: 'bookingStatusCompleted',
      desc: '',
      args: [],
    );
  }

  /// `ملغى`
  String get bookingStatusCancelled {
    return Intl.message(
      'ملغى',
      name: 'bookingStatusCancelled',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد حجوزات سابقة`
  String get previousBookingsEmpty {
    return Intl.message(
      'لا توجد حجوزات سابقة',
      name: 'previousBookingsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ أثناء تحميل الحجوزات`
  String get previousBookingsError {
    return Intl.message(
      'حدث خطأ أثناء تحميل الحجوزات',
      name: 'previousBookingsError',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد حجز`
  String get bookingPageEmpty {
    return Intl.message(
      'لا يوجد حجز',
      name: 'bookingPageEmpty',
      desc: '',
      args: [],
    );
  }

  /// `الحجز غير موجود`
  String get bookingPageErrorBookingNotFound {
    return Intl.message(
      'الحجز غير موجود',
      name: 'bookingPageErrorBookingNotFound',
      desc: '',
      args: [],
    );
  }

  /// `الأخصائي غير موجود`
  String get bookingPageErrorSpecialistNotFound {
    return Intl.message(
      'الأخصائي غير موجود',
      name: 'bookingPageErrorSpecialistNotFound',
      desc: '',
      args: [],
    );
  }

  /// `ليس لديك صلاحية لعرض هذا الحجز`
  String get bookingPageErrorUnauthorized {
    return Intl.message(
      'ليس لديك صلاحية لعرض هذا الحجز',
      name: 'bookingPageErrorUnauthorized',
      desc: '',
      args: [],
    );
  }

  /// `تعذر تحميل بيانات الحجز، يرجى المحاولة مرة أخرى`
  String get bookingPageErrorGeneric {
    return Intl.message(
      'تعذر تحميل بيانات الحجز، يرجى المحاولة مرة أخرى',
      name: 'bookingPageErrorGeneric',
      desc: '',
      args: [],
    );
  }

  /// `البحث`
  String get searchTitle {
    return Intl.message('البحث', name: 'searchTitle', desc: '', args: []);
  }

  /// `ابحث عن خدمة أو أخصائي`
  String get searchHint {
    return Intl.message(
      'ابحث عن خدمة أو أخصائي',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `اكتب كلمة للبدء بالبحث`
  String get searchPrompt {
    return Intl.message(
      'اكتب كلمة للبدء بالبحث',
      name: 'searchPrompt',
      desc: '',
      args: [],
    );
  }

  /// `نتائج البحث عن: {query}`
  String searchResultsFor(String query) {
    return Intl.message(
      'نتائج البحث عن: $query',
      name: 'searchResultsFor',
      desc: '',
      args: [query],
    );
  }

  /// `لا توجد نتائج مطابقة لبحثك`
  String get searchNoData {
    return Intl.message(
      'لا توجد نتائج مطابقة لبحثك',
      name: 'searchNoData',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ أثناء البحث`
  String get searchError {
    return Intl.message(
      'حدث خطأ أثناء البحث',
      name: 'searchError',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد أخصائيون لإعادة الحجز معهم بعد`
  String get homeRebookingEmpty {
    return Intl.message(
      'لا يوجد أخصائيون لإعادة الحجز معهم بعد',
      name: 'homeRebookingEmpty',
      desc: '',
      args: [],
    );
  }

  /// `تعذّر تحميل قائمة إعادة الحجز`
  String get homeRebookingError {
    return Intl.message(
      'تعذّر تحميل قائمة إعادة الحجز',
      name: 'homeRebookingError',
      desc: '',
      args: [],
    );
  }

  /// `مهنة`
  String get professionalDetails {
    return Intl.message(
      'مهنة',
      name: 'professionalDetails',
      desc: '',
      args: [],
    );
  }

  /// `مثال: مدرس رياضيات،مصلح دراجات نارية،خياطة نسائية`
  String get professionalhint {
    return Intl.message(
      'مثال: مدرس رياضيات،مصلح دراجات نارية،خياطة نسائية',
      name: 'professionalhint',
      desc: '',
      args: [],
    );
  }

  /// `هذا الحساب لم يتم توثيقه بعد، لا يمكنك الحجز معه`
  String get profileNotVerified {
    return Intl.message(
      'هذا الحساب لم يتم توثيقه بعد، لا يمكنك الحجز معه',
      name: 'profileNotVerified',
      desc: '',
      args: [],
    );
  }

  /// `هذا الحساب لم يتم توثيقه بعد، لا يمكنك الاتصال به`
  String get profileNotcallVerified {
    return Intl.message(
      'هذا الحساب لم يتم توثيقه بعد، لا يمكنك الاتصال به',
      name: 'profileNotcallVerified',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
