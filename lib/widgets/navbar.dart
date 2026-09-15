import 'package:flutter/material.dart';
import '../utils/app_color.dart';
import '../utils/screen_helper.dart';
import '../utils/r_font.dart';

class NavBar extends StatefulWidget {
  final bool menuOpen;
  final Function(bool) onMenuToggle;
  final Function(String) onNavTap;
  final String activeSection;

  const NavBar({
    super.key,
    required this.onNavTap,
    required this.activeSection,
    required this.menuOpen,
    required this.onMenuToggle,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  final List<String> _navItems = [
    'Home',
    'About',
    'Services',
    'Why Us',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ScreenHelper.isMobile(context);

        return Container(
          color: AppColor.primary,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 40,
            vertical: 14,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AERIE BOX',
                        style: TextStyle(
                          color: AppColor.secondary,
                          fontSize: RFont.size(context, 16, tablet: 18, desktop: 20),
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                        ),
                      ),
                      Text(
                        'RENTAL SOLUTIONS',
                        style: TextStyle(
                          color: AppColor.white.withOpacity(0.7),
                          fontSize: RFont.size(context, 9, tablet: 10, desktop: 11),
                          letterSpacing: 3,
                        ),
                      ),
                    ],
                  ),

                  // Desktop Nav
                  if (!isMobile)
                    Row(
                      children: _navItems.map((item) {
                        final isActive = widget.activeSection == item;
                        return GestureDetector(
                          onTap: () => widget.onNavTap(item),
                          child: Container(
                            margin: const EdgeInsets.only(left: 28),
                            padding: const EdgeInsets.only(bottom: 4),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: isActive ? AppColor.secondary : Colors.grey,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Text(
                              item,
                              style: TextStyle(
                                color: isActive ? AppColor.secondary : Colors.grey,
                                fontSize: RFont.size(context, 13, desktop: 14),
                                fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                  // Mobile hamburger
                  if (isMobile)
                    IconButton(
                      onPressed: () {
                        widget.onMenuToggle(!widget.menuOpen);
                      },
                      icon: Icon(
                        widget.menuOpen ? Icons.close : Icons.menu,
                        color: AppColor.white,
                      ),
                    ),
                ],
              ),

              // Mobile dropdown menu
              if (isMobile && widget.menuOpen)
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: Column(
                    children: _navItems.map((item) {
                      final isActive = widget.activeSection == item;
                      return GestureDetector(
                        onTap: () {
                          widget.onNavTap(item);
                          widget.onMenuToggle(false);
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColor.white.withOpacity(0.1),
                              ),
                            ),
                          ),
                          child: Text(
                            item,
                            style: TextStyle(
                              color: isActive ? AppColor.secondary : Colors.grey,
                              fontSize: 14,
                              fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
