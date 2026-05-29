import 'package:url_launcher/url_launcher.dart';

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );

  await launchUrl(launchUri);
}

Future<void> openEmail() async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'ravitanexus.epc@gmail.com',
    query: 'subject=Business Inquiry',
  );

  await launchUrl(emailUri);
}

// Future<void> openWhatsApp() async {
//   final Uri whatsapp = Uri.parse(
//     'https://wa.me/917477090895',
//   );
//
//   if (await canLaunchUrl(whatsapp)) {
//     await launchUrl(
//       whatsapp,
//       mode: LaunchMode.externalApplication,
//     );
//   }
// }
Future<void> openWhatsApp() async {
  final Uri whatsapp = Uri.parse(
    'https://wa.me/917477090895?text=Hello%20Ravita%20Nexus',
  );

  if (await canLaunchUrl(whatsapp)) {
    await launchUrl(
      whatsapp,
      mode: LaunchMode.externalApplication,
    );
  }
}