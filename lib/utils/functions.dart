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
    path: 'contact@aeriebox.com',
    query: 'subject=Room Inquiry',
  );

  await launchUrl(emailUri);
}

Future<void> openWhatsApp() async {
  final Uri whatsapp = Uri.parse(
    'https://wa.me/916266511433?text=Hello%20Aerie%20Box',
  );

  if (await canLaunchUrl(whatsapp)) {
    await launchUrl(
      whatsapp,
      mode: LaunchMode.externalApplication,
    );
  }
}