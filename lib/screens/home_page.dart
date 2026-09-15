import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_color.dart';
import '../utils/functions.dart';
import '../utils/screen_helper.dart';
import '../widgets/navbar.dart';
import 'hero_section.dart';
import 'about_section.dart';
import 'services_section.dart';
import 'why_us_section.dart';
import 'contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  String _activeSection = 'Home';

  // GlobalKeys for each section
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _whyUsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _menuOpen = false;

  Map<String, GlobalKey> get _sectionKeys => {
    'Home': _homeKey,
    'About': _aboutKey,
    'Services': _servicesKey,
    'Why Us': _whyUsKey,
    'Contact': _contactKey,
  };

  void _scrollToSection(String section) {
    setState(() => _activeSection = section);
    final key = _sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [

          SliverToBoxAdapter(
            child: Container(
              color: AppColor.primary,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = ScreenHelper.isMobile(context);

                  return Wrap(
                    alignment: isMobile
                        ? WrapAlignment.center
                        : WrapAlignment.end,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 20,
                    runSpacing: 10,
                    children: [

                      /// EMAIL
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.email_outlined,
                            color: Colors.white.withOpacity(0.9),
                            size: 18,
                          ),

                          const SizedBox(width: 8),

                          SelectableText(
                            "contact@aeriebox.com",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      /// PHONE
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.call,
                            color: AppColor.white,
                            size: 18,
                          ),

                          const SizedBox(width: 8),

                          SelectableText(
                            "+91-6266511433",
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,

            automaticallyImplyLeading: false,

            backgroundColor: AppColor.primary,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,

            elevation: 0,
            scrolledUnderElevation: 0,

            toolbarHeight: 0,

            expandedHeight: 0,

            bottom: PreferredSize(
              preferredSize: Size.fromHeight(
                ScreenHelper.isMobile(context)
                    ? (_menuOpen ? 320 : 90)
                    : 80,
              ),
              child: Container(
                color: AppColor.primary,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: NavBar(
                  onNavTap: _scrollToSection,
                  activeSection: _activeSection,
                  menuOpen: _menuOpen,
                  onMenuToggle: (value) {
                    setState(() {
                      _menuOpen = value;
                    });
                  },
                ),
              ),
            ),
          ),
          /// BODY
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  key: _homeKey,
                  child: HeroSection(
                    onContactTap: () => _scrollToSection('Contact'),
                  ),
                ),

                SizedBox(
                  key: _aboutKey,
                  child: const AboutSection(),
                ),

                SizedBox(
                  key: _servicesKey,
                  child: const ServicesSection(),
                ),

                SizedBox(
                  key: _whyUsKey,
                  child: const WhyUsSection(),
                ),

                SizedBox(
                  key: _contactKey,
                  child: const ContactSection(),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: openWhatsApp,
        backgroundColor: AppColor.secondary,
        child:  FaIcon(
          FontAwesomeIcons.whatsapp,
          color: AppColor.success,
        ),
      ),    );
  }
}
