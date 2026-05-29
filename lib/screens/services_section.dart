import 'package:flutter/material.dart';
import '../utils/app_color.dart';
import '../utils/screen_helper.dart';
import '../utils/r_font.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  int _activeTab = 0;

  final List<Map<String, dynamic>> _services = [
    {
      'icon': Icons.electrical_services,
      'title': 'Electrical Works',
      'emoji': '⚡',
      'items': [
        'Liaisoning & load sanction up to final line charging',
        'OH line erection works',
        'DP / FP structure installation',
        '33kV / 11kV transformer installation',
        'Coordination with government authorities',
        'HT/LT panel erection, testing & commissioning',
        'Distribution board installation',
        'Cable tray installation',
        'Cable laying & termination',
        'Lighting systems installation',
        'Earthing & grounding systems',
        'ELV systems (CCTV, Networking, FAS, PA system)',
        'Fire fighting works',
      ],
    },
    {
      'icon': Icons.construction,
      'title': 'Infrastructure Works',
      'emoji': '🏗️',
      'items': [
        'Structural fabrication & erection',
        'Site preparation & civil coordination',
        'Foundation works',
        'Steel structure installation',
        'Industrial shed construction',
        'Civil support for electrical works',
      ],
    },
    {
      'icon': Icons.engineering,
      'title': 'Engineering & Project Support',
      'emoji': '📊',
      'items': [
        'BOQ preparation',
        'Cost estimation & budgeting',
        'Vendor management',
        'Project coordination & execution',
        'Technical documentation',
        'Quality assurance & inspections',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ScreenHelper.isMobile(context);
        final isTablet = ScreenHelper.isTablet(context);

        return Container(
          color: AppColor.white,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : (isTablet ? 60 : 120),
            vertical: isMobile ? 50 : 80,
          ),
          child: Column(
            children: [
              Text(
                'WHAT WE DO',
                style: TextStyle(
                  color: AppColor.secondary,
                  fontSize: RFont.size(context, 11, desktop: 12),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 3,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Our Core Services',
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: RFont.size(context, 22, tablet: 28, desktop: 36),
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 40),
              _buildTabs(context, isMobile),
              const SizedBox(height: 32),
              _buildActiveContent(context, isMobile),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabs(BuildContext context, bool isMobile) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_services.length, (index) {
          final isActive = _activeTab == index;
          return GestureDetector(
            onTap: () => setState(() => _activeTab = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 12),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 24,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: isActive ? AppColor.primary : AppColor.surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isActive ? AppColor.primary : Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  Text(
                    _services[index]['emoji'],
                    style:  TextStyle(fontSize: 16,
                      color: isActive ? AppColor.white : AppColor.title,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _services[index]['title'],
                    style: TextStyle(
                      color: isActive ? AppColor.white : AppColor.title,
                      fontSize: RFont.size(context, 13, desktop: 14),
                      fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildActiveContent(BuildContext context, bool isMobile) {
    final service = _services[_activeTab];
    final items = service['items'] as List<String>;
    final halfLen = (items.length / 2).ceil();

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Container(
        key: ValueKey(_activeTab),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.primary.withOpacity(0.08)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    service['icon'] as IconData,
                    color: AppColor.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  service['title'],
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: RFont.size(context, 18, desktop: 22),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            isMobile
                ? _buildSingleColumn(context, items)
                : _buildTwoColumns(context, items, halfLen),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleColumn(BuildContext context, List<String> items) {
    return Column(
      children: items.map((item) => _buildItem(context, item)).toList(),
    );
  }

  Widget _buildTwoColumns(BuildContext context, List<String> items, int halfLen) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: items.sublist(0, halfLen).map((item) => _buildItem(context, item)).toList(),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            children: items.sublist(halfLen).map((item) => _buildItem(context, item)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, String item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppColor.secondary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              item,
              style: TextStyle(
                color: AppColor.subtitle,
                fontSize: RFont.size(context, 13, desktop: 14),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
