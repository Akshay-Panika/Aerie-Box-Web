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
      'icon': Icons.meeting_room_outlined,
      'title': 'Room Rentals',
      'items': [
        'Fully furnished rental rooms',
        'Single & sharing room options',
        'Daily, weekly & monthly bookings',
        'AC & non-AC rooms available',
        'Attached bathroom facilities',
        '24/7 water & electricity supply',
        'Housekeeping & maintenance support',
        'Secure & gated premises',
        'Flexible check-in & check-out',
        'Transparent pricing, no hidden charges',
        'Easy online room booking',
        'Prime location connectivity',
        'Dedicated tenant support',
      ],
    },
    {
      'icon': Icons.apartment_outlined,
      'title': 'PG & Accommodation',
      'items': [
        'PG rooms for students & professionals',
        'Hostel-style shared accommodation',
        'Meals & mess facility options',
        'Wi-Fi & internet connectivity',
        'Common lounge & study area',
        'Laundry & ironing services',
        'CCTV secured premises',
        'Warden & security support',
      ],
    },
    {
      'icon': Icons.chair_outlined,
      'title': 'Room Products & Services',
      'items': [
        'Room furniture on rent',
        'Bed, mattress & wardrobe rental',
        'Study table & chair sets',
        'Mini fridge & appliance rental',
        'Room setup & interior assistance',
        'Custom room customization',
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
                  Icon(
                    _services[index]['icon'] as IconData,
                    size: 18,
                    color: isActive ? AppColor.white : AppColor.title,
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
              color: AppColor.primary,
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