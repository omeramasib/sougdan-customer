import 'package:eshop_multivendor/Helper/ApiBaseHelper.dart';

//Your application name
const String appName = 'Sougdan';

//Your package name
const String packageName = 'com.sougdan.customer';
const String iosPackage = 'com.sougdan.customer';

//Playstore link of your application
const String androidLink = 'https://play.google.com/store/apps/details?id=';

//Appstore link of your application
const String iosLink = 'your ios link here';

//Appstore id
const String appStoreId = '123456789';

//Link for share product (get From Firebase)
const String deepLinkUrlPrefix = 'https://eshopmultivendor.page.link';
const String deepLinkName = 'eshop';

//Set labguage
String defaultLanguage = 'ar';

//Set country code
String defaultCountryCode = 'SD';

//Time settings
const int timeOut = 50;
const int perPage = 10;

//FontSize
const double textFontSize10 = 10;
const double textFontSize12 = 12;
const double textFontSize14 = 14;
const double textFontSize16 = 16;

//Radius
const double circularBorderRadius5 = 5;
const double circularBorderRadius7 = 7;
const double circularBorderRadius10 = 10;

//Token ExpireTime in minutes & issuer name
const int tokenExpireTime = 5;
const String issuerName = 'eshop';

//General Error Message
const String errorMesaage = 'Something went wrong, Error : ';

//Bank detail hint text
const String BANK_DETAIL =
    'Bank Details:\nAccount No :123XXXXX\nIFSC Code: 123XXX \nName: Abc xyz';

//Api class instance
ApiBaseHelper apiBaseHelper = ApiBaseHelper();

// CREDENTIAL FOR CONNECT APP TO ADMIN PANEL
const String baseUrl = 'https://sougdan.com/app/v1/api/';
const String jwtKey = '0774ab7751547a5b4e5f72dfe3d7ee0f7f8f8a49';
