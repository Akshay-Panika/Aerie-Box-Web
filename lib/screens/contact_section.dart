import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_color.dart';
import '../utils/functions.dart';
import '../utils/screen_helper.dart';
import '../utils/r_font.dart';
import 'about_section.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ScreenHelper.isMobile(context);
        final isTablet = ScreenHelper.isTablet(context);

        return Column(
          children: [
            // Contact Section
            Container(
              color: AppColor.surface,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : (isTablet ? 60 : 120),
                vertical: isMobile ? 50 : 80,
              ),
              child: Column(
                children: [
                  Text(
                    'GET IN TOUCH',
                    style: TextStyle(
                      color: AppColor.error,
                      fontSize: RFont.size(context, 11, desktop: 12),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: RFont.size(context, 22, tablet: 28, desktop: 36),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Looking for a room? Reach out to us today.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.subtitle,
                      fontSize: RFont.size(context, 14, desktop: 16),
                    ),
                  ),
                  const SizedBox(height: 50),
                  isMobile
                      ? _buildMobileContact(context)
                      : _buildDesktopContact(context),
                ],
              ),
            ),

            // Footer
            _buildFooter(context, isMobile, isTablet),
          ],
        );
      },
    );
  }

  Widget _buildMobileContact(BuildContext context) {
    return Column(
      children: [
        _buildContactInfo(context),
        const SizedBox(height: 32),
        _buildAppDownloadCard(context),
      ],
    );
  }

  Widget _buildDesktopContact(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: _buildContactInfo(context)),
        const SizedBox(width: 60),
        Expanded(flex: 4, child: _buildAppDownloadCard(context)),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    final contacts = [
      {
        'icon': Icons.location_on_outlined,
        'label': 'Location',
        'value': 'Jabalpur, Madhya Pradesh',
      },
      {
        'icon': Icons.phone_outlined,
        'label': 'Phone',
        'value': '+91-6266511433',
      },
      {
        'icon': Icons.email_outlined,
        'label': 'Email',
        'value': 'contact@aeriebox.com',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Aerie Box Room Rentals',
          style: TextStyle(
            color: AppColor.primary,
            fontSize: RFont.size(context, 20, desktop: 24),
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 24),
        ...contacts.map((contact) => Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: AppColor.primary.withOpacity(0.06),
                blurRadius: 12,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              if(contact['label'] == 'Email'){
                openEmail();
              }
            },
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColor.secondary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    contact['icon'] as IconData,
                    color: AppColor.secondary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact['label'] as String,
                      style: TextStyle(
                        color: AppColor.subtitle,
                        fontSize: RFont.size(context, 11, desktop: 12),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 2),
                    SelectableText(
                      contact['value'] as String,
                      style: TextStyle(
                        color: AppColor.primary,
                        fontSize: RFont.size(context, 14, desktop: 15),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }

  Widget _buildAppDownloadCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      // decoration: BoxDecoration(
      //   gradient: const LinearGradient(
      //     colors: [AppColor.primary, Color(0xFF002080)],
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //   ),
      //   borderRadius: BorderRadius.circular(16),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            'Download our app to find, book and manage your rental rooms on the go.',
            style: TextStyle(
              color: AppColor.primary,
              fontSize: RFont.size(context, 14, desktop: 15),
              height: 1.5,
            ),
          ),

          const SizedBox(height: 24),
           Center(
             child: Container(
               height: 400,width: 200,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(16),
                 border: Border.all(color: Colors.black),
                 image: DecorationImage(image: AssetImage("assets/images/aeriebox_app.jpeg"),fit: BoxFit.fill)
               ),
             ),
           ),

          const SizedBox(height: 24),

          /// App Store Buttons
          Row(
            children: [
              Expanded(
                child: _buildStoreButton(
                  icon: FontAwesomeIcons.apple,
                  topText: 'Download on the',
                  bottomText: 'App Store',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStoreButton(
                  icon: FontAwesomeIcons.googlePlay,
                  topText: 'Get it on',
                  bottomText: 'Google Play',
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            'Aerie Box Rental Services',
            style: TextStyle(
              color: AppColor.primary,
              fontSize: RFont.size(context, 12, desktop: 13),
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreButton({
    required FaIconData icon,
    required String topText,
    required String bottomText,
  }) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColor.white.withOpacity(0.15),
          ),
        ),
        child: Row(
          children: [
            FaIcon(
              icon,
              color: AppColor.white,
              size: 22,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    topText,
                    style: TextStyle(
                      color: AppColor.white.withOpacity(0.7),
                      fontSize: 9,
                      letterSpacing: 0.3,
                    ),
                  ),
                  Text(
                    bottomText,
                    style: const TextStyle(
                      color: AppColor.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context, bool isMobile, bool isTablet) {
    return Container(
      color: AppColor.primary,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 60 : 120),
        vertical: 32,
      ),
      child: Column(
        children: [
          if (!isMobile)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Left Logo
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aerie Box',
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: RFont.size(context, 16, desktop: 18),
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                      ),
                    ),

                    Text(
                      'ROOM RENTALS',
                      style: TextStyle(
                        color: AppColor.white.withOpacity(0.5),
                        fontSize: RFont.size(context, 9, desktop: 10),
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),

                /// Social Icons
                Row(
                  children: [
                    _buildSocialIcon(
                      icon: FontAwesomeIcons.facebook,
                      onTap: () {},
                    ),

                    const SizedBox(width: 12),

                    _buildSocialIcon(
                      icon: FontAwesomeIcons.instagram,
                      onTap: () {},
                    ),

                    const SizedBox(width: 12),

                    _buildSocialIcon(
                      icon: FontAwesomeIcons.linkedinIn,
                      onTap: () {},
                    ),

                    const SizedBox(width: 12),

                    _buildSocialIcon(
                      icon: FontAwesomeIcons.xTwitter,
                      onTap: () {},
                    ),
                  ],
                ),

                /// Copyright
                Text(
                  '© 2026 Aerie Box Room Rentals. All rights reserved.',
                  style: TextStyle(
                    color: AppColor.white.withOpacity(0.45),
                    fontSize: RFont.size(context, 12, desktop: 13),
                  ),
                ),
              ],
            )
          else
            Column(
              children: [
                /// Logo
                Text(
                  'AERIE BOX',
                  style: TextStyle(
                    color: AppColor.secondary,
                    fontSize: RFont.size(context, 15),
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  'ROOM RENTALS',
                  style: TextStyle(
                    color: AppColor.white.withOpacity(0.5),
                    fontSize: RFont.size(context, 9),
                    letterSpacing: 3,
                  ),
                ),

                const SizedBox(height: 20),

                /// Social Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon(
                      icon: FontAwesomeIcons.facebookF,
                      onTap: () {},
                    ),

                    const SizedBox(width: 12),

                    _buildSocialIcon(
                      icon: FontAwesomeIcons.instagram,
                      onTap: () {},
                    ),

                    const SizedBox(width: 12),

                    _buildSocialIcon(
                      icon: FontAwesomeIcons.linkedinIn,
                      onTap: () {},
                    ),

                    const SizedBox(width: 12),

                    _buildSocialIcon(
                      icon: FontAwesomeIcons.xTwitter,
                      onTap: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Text(
                  '© 2026 Aerie Box\nAll rights reserved.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.white.withOpacity(0.45),
                    fontSize: RFont.size(context, 11),
                    height: 1.6,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon({
    required FaIconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.white.withOpacity(0.06),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColor.white.withOpacity(0.08),
          ),
        ),
        child: FaIcon(
          icon,
          color: AppColor.secondary,
          size: 16,
        ),
      ),
    );
  }}