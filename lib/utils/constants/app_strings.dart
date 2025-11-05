import 'package:get/get.dart';
import 'language_controller.dart';

class AppStrings {
  // Fallback-Flag, falls kein LanguageController verfügbar ist
  static bool _isGerman = false;
  
  // Manuelles Setzen der Sprache (nur als Fallback gedacht)
  static void setGerman(bool german) {
    _isGerman = german;
  }
  
  // Ermittelt, ob Deutsch aktiv ist:
  // 1) versucht den LanguageController (reaktiv)
  // 2) fällt zurück auf das lokale _isGerman-Flag
  static bool get isGerman {
    try {
      return Get.find<LanguageController>().isGerman.value;
    } catch (e) {
      return _isGerman;
    }
  }
  
  // =================== Allgemein / Navigation ===================
  static String get appTitle => isGerman ? "Dartify Store" : "Dartify Store"; // identisch in DE/EN
  static String get goodDay => isGerman ? "Schöner Tag zum Einkaufen" : "Good day for shopping";
  static String get searchInStore => isGerman ? "Im Store suchen" : "Search in Store";
  static String get yourFriends => isGerman ? "Deine Freunde" : "Your friends";
  static String get popularProducts => isGerman ? "Beliebte Produkte" : "Popular Products";
  static String get store => isGerman ? "Store" : "Store";
  static String get wishlist => isGerman ? "Wunschliste" : "Wishlist";
  static String get account => isGerman ? "Konto" : "Account";
  static String get home => isGerman ? "Startseite" : "Home";
  static String get logout => isGerman ? "Abmelden" : "Logout";
  static String get accountSettings => isGerman ? "Konto-Einstellungen" : "Account settings";
  static String get appSettings => isGerman ? "App-Einstellungen" : "App Settings";
  static String get myAddresses => isGerman ? "Meine Adressen" : "My Addresses";
  static String get myCart => isGerman ? "Mein Warenkorb" : "My Cart";
  static String get myOrders => isGerman ? "Meine Bestellungen" : "My Orders";
  static String get bankAccount => isGerman ? "Bankkonto" : "Bank Account";
  static String get myCoupons => isGerman ? "Meine Gutscheine" : "My Coupons";
  static String get notifications => isGerman ? "Benachrichtigungen" : "Notifications";
  static String get accountPrivacy => isGerman ? "Konto-Privatsphäre" : "Account Privacy";
  static String get loadData => isGerman ? "Daten laden" : "Load Data";
  static String get geolocation => isGerman ? "Standort" : "Geolocation";
  static String get safeMode => isGerman ? "Sicherer Modus" : "Safe Mode";
  static String get hdImageQuality => isGerman ? "HD-Bildqualität" : "HD Image Quality";
  static String get darkMode => isGerman ? "Dunkler Modus" : "Dark Mode";
  
  // =================== Profil / Konto ===================
  static String get profile => isGerman ? "Profil" : "Profile";
  static String get changeProfilePicture => isGerman ? "Profilbild ändern" : "Change Profile Picture";
  static String get profileInformation => isGerman ? "Profil-Informationen" : "Profile Information";
  static String get personalInformation => isGerman ? "Persönliche Informationen" : "Personal Information";
  static String get name => isGerman ? "Name" : "Name";
  static String get email => isGerman ? "E-Mail" : "E-Mail";
  static String get userId => isGerman ? "Benutzer-ID" : "User ID";
  static String get phoneNumber => isGerman ? "Telefonnummer" : "Phone Number";
  static String get gender => isGerman ? "Geschlecht" : "Gender";
  static String get dateOfBirth => isGerman ? "Geburtsdatum" : "Date of Birth";
  static String get deleteAccount => isGerman ? "Konto löschen" : "Delete Account";
  static String get male => isGerman ? "Männlich" : "Male";
  static String get female => isGerman ? "Weiblich" : "Female";
  static String get diverse => isGerman ? "Divers" : "Diverse";
  
  // =================== Settings-Untertexte ===================
  static String get setShoppingDeliveryAddress => isGerman ? "Lieferadresse für Einkäufe festlegen" : "Set shopping delivery address";
  static String get addRemoveProductsCheckout => isGerman ? "Produkte hinzufügen, entfernen und zur Kasse gehen" : "Add, remove products and move to checkout";
  static String get inProgressCompletedOrders => isGerman ? "Laufende und abgeschlossene Bestellungen" : "In-progress and Completed Orders";
  static String get withdrawBalanceBank => isGerman ? "Guthaben auf registriertes Bankkonto abheben" : "Withdraw balance to registered bank account";
  static String get listDiscountedCoupons => isGerman ? "Liste aller Rabatt-Gutscheine" : "List of all the discounted coupons";
  static String get setNotificationMessages => isGerman ? "Benachrichtigungen einstellen" : "Set any kind of notifications message";
  static String get manageDataUsageAccounts => isGerman ? "Datennutzung und verbundene Konten verwalten" : "Manage data usage and connected accounts";
  static String get uploadDataCloudFirebase => isGerman ? "Daten in die Cloud Firebase hochladen" : "Upload Data to your Cloud firebase";
  static String get setRecommendationLocation => isGerman ? "Empfehlungen basierend auf Standort" : "Set recommendation based on location";
  static String get searchResultsSafeAllAges => isGerman ? "Suchergebnisse sind sicher für alle Altersgruppen" : "Search result is safe for all ages";
  static String get setImageQualitySeen => isGerman ? "Bildqualität einstellen" : "Set image quality to be seen";
  static String get switchLightDarkTheme => isGerman ? "Zwischen hellem und dunklem Design wechseln" : "Switch between light and dark theme";
  static String get useGermanLanguage => isGerman ? "Deutsche Sprache verwenden" : "Use German language";
  static String get noInformation => isGerman ? "Keine Information" : "No information";
  
  // =================== Home Screen ===================
  static String get hello => isGerman ? "Hallo" : "Hello";
  static String get friend => isGerman ? "Freund" : "Friend";
  static String get promoBanner => isGerman ? "Werbebanner" : "Promo Banner";
  
  // =================== Store Screen ===================
  static String get featuredBrands => isGerman ? "Beliebte Marken" : "Featured Brands";
  static String get viewAll => isGerman ? "Alle anzeigen" : "View All";
  static String get brand => isGerman ? "Marke" : "Brand";
  static String get products => isGerman ? "Produkte" : "Products";
  static String get sports => isGerman ? "Sport" : "Sports";
  static String get furniture => isGerman ? "Möbel" : "Furniture";
  static String get electronics => isGerman ? "Elektronik" : "Electronics";
  static String get clothes => isGerman ? "Kleidung" : "Clothes";
  static String get cosmetics => isGerman ? "Kosmetik" : "Cosmetics";
  static String get brandName => isGerman ? "Markenname" : "Brand Name";
  static String get allBrands => isGerman ? "Alle Marken" : "All Brands";
}
