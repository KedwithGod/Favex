// terms and condition
// const baseSiteUrl = 'http://localhost:8069/';
import '../../imports/shared.dart';

String siteBaseSiteUrl() {
  if (Platform.isAndroid) {
    return 'http://127.0.0.1:8069/'; // Android emulator's localhost
  } else if (Platform.isIOS) {
    return 'http://localhost:8069/'; // iOS simulator's localhost
  } else {
    return 'http://192.168.1.10:8069/'; // Replace with your machine's local IP address
  }
}
String tacUrl ="${siteBaseSiteUrl()}terms";


// external api




 







