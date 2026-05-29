import 'package:flutter/material.dart';
import '../utils/app_color.dart';
import '../utils/screen_helper.dart';
import '../utils/r_font.dart';
import 'about_section.dart';
import 'dart:async';

class WhyUsSection extends StatefulWidget {
  const WhyUsSection({super.key});

  @override
  State<WhyUsSection> createState() => _WhyUsSectionState();
}

class _WhyUsSectionState extends State<WhyUsSection> {

  late final ScrollController _scrollController;

  bool _autoScrolling = true;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoScroll();
    });
  }

  Future<void> _autoScroll() async {
    while (_autoScrolling && mounted) {
      await Future.delayed(const Duration(milliseconds: 30));

      if (!_scrollController.hasClients) continue;

      final maxScroll =
          _scrollController.position.maxScrollExtent;

      final current = _scrollController.offset;

      double next = current + 1;

      if (next >= maxScroll) {
        next = 0;
      }

      if (mounted && _scrollController.hasClients) {
        _scrollController.jumpTo(next);
      }
    }
  }

  @override
  void dispose() {
    _autoScrolling = false;

    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ScreenHelper.isMobile(context);
        final isTablet = ScreenHelper.isTablet(context);

        return Column(
          children: [
            // Why Choose Us
            Container(
              color: AppColor.surface,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : (isTablet ? 60 : 120),
                vertical: isMobile ? 50 : 80,
              ),
              child: Column(
                children: [
                  Text(
                    'WHY CHOOSE US',
                    style: TextStyle(
                      color: AppColor.secondary,
                      fontSize: RFont.size(context, 11, desktop: 12),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'The Ravita Nexus Advantage',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: RFont.size(context, 22, tablet: 28, desktop: 36),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildWhyUsGrid(context, isMobile),
                ],
              ),
            ),

            // Testimonials
            Container(
              color: AppColor.white,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : (isTablet ? 60 : 120),
                vertical: isMobile ? 50 : 70,
              ),
              child: Column(
                children: [
                  Text(
                    'CLIENT TESTIMONIALS',
                    style: TextStyle(
                      color: AppColor.secondary,
                      fontSize: RFont.size(context, 11, desktop: 12),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 3,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'What Our Clients Say',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: RFont.size(
                        context,
                        22,
                        tablet: 28,
                        desktop: 34,
                      ),
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    height: 260,
                    child: ListView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildTestimonialCard(
                          context,
                          name: 'Industrial Client',
                          role: 'Manufacturing Unit',
                          review:
                          'Ravita Nexus delivered the project on time with excellent execution quality and professional coordination.',
                        ),

                        _buildTestimonialCard(
                          context,
                          name: 'Commercial Partner',
                          role: 'Infrastructure Project',
                          review:
                          'Their costing accuracy and site management helped us complete the project smoothly without delays.',
                        ),

                        _buildTestimonialCard(
                          context,
                          name: 'Electrical Contractor',
                          role: 'Electrical Contracting',
                          review:
                          'Professional team with strong execution capability and proper site supervision throughout the project.',
                        ),

                        _buildTestimonialCard(
                          context,
                          name: 'Project Consultant',
                          role: 'Commercial Development',
                          review:
                          'Excellent coordination, transparent communication and timely project handover impressed our team.',
                        ),
                      ]
                          .map(
                            (e) => Padding(
                          padding: const EdgeInsets.only(right: 18),
                          child: SizedBox(
                            width: isMobile ? 320 : 380,
                            child: e,
                          ),
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),

            // Industries
            Container(
              color: AppColor.primary,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : (isTablet ? 60 : 120),
                vertical: isMobile ? 50 : 80,
              ),
              child: Column(
                children: [
                  Text(
                    'INDUSTRIES WE SERVE',
                    style: TextStyle(
                      color: AppColor.secondary,
                      fontSize: RFont.size(context, 11, desktop: 12),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildIndustriesGrid(context, isMobile),
                ],
              ),
            ),

            // Work Approach
            Container(
              color: AppColor.white,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : (isTablet ? 60 : 120),
                vertical: isMobile ? 50 : 80,
              ),
              child: Column(
                children: [
                  Text(
                    'HOW WE WORK',
                    style: TextStyle(
                      color: AppColor.secondary,
                      fontSize: RFont.size(context, 11, desktop: 12),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Our Work Approach',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: RFont.size(context, 22, tablet: 28, desktop: 36),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildWorkApproach(context, isMobile),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildWhyUsGrid(BuildContext context, bool isMobile) {
    final reasons = [
      {
        'icon': Icons.calculate_outlined,
        'title': 'Costing Expertise',
        'desc': 'Strong expertise in costing & estimation for accurate project planning',
      },
      {
        'icon': Icons.schedule,
        'title': 'On-Time Delivery',
        'desc': 'Focus on on-time completion with zero compromise on deadlines',
      },
      {
        'icon': Icons.groups_outlined,
        'title': 'Reliable Network',
        'desc': 'Reliable labour & vendor network for seamless project execution',
      },
      {
        'icon': Icons.verified_outlined,
        'title': 'Quality & Safety',
        'desc': 'Commitment to quality & safety at every stage of the project',
      },
    ];

    return isMobile
        ? Column(children: reasons.map((r) => Padding(
      padding: const EdgeInsets.only(bottom: 16),
          child: _buildReasonCard(context, r),
        )).toList())
        : Row(
            children: reasons.map((r) => Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: _buildReasonCard(context, r),
              ),
            )).toList(),
          );
  }

  Widget _buildReasonCard(BuildContext context, Map<String, dynamic> data) {
    return HoverCard(
      child: Container(
        width: double.infinity,
        // margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColor.primary.withOpacity(0.07),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.secondary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(data['icon'] as IconData, color: AppColor.secondary, size: 22),
            ),
            const SizedBox(height: 14),
            Text(
              data['title'] as String,
              style: TextStyle(
                color: AppColor.primary,
                fontSize: RFont.size(context, 14, desktop: 16),
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              data['desc'] as String,
              style: TextStyle(
                color: AppColor.subtitle,
                fontSize: RFont.size(context, 12, desktop: 13),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndustriesGrid(BuildContext context, bool isMobile) {
    final industries = [
      {'icon': Icons.factory_outlined, 'label': 'Industrial Projects'},
      {'icon': Icons.apartment_outlined, 'label': 'Commercial Buildings'},
      {'icon': Icons.location_city_outlined, 'label': 'Infrastructure Development'},
      {'icon': Icons.electric_bolt_outlined, 'label': 'Electrical Contracting'},
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: industries.map((ind) {
        return HoverCard(
          child: Container(
            width: isMobile ? double.infinity : 200,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: AppColor.white.withOpacity(0.07),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.white.withOpacity(0.15)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(ind['icon'] as IconData, color: AppColor.secondary, size: 36),
                const SizedBox(height: 12),
                Text(
                  ind['label'] as String,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: RFont.size(context, 13, desktop: 14),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildWorkApproach(BuildContext context, bool isMobile) {
    final steps = [
      {'num': '01', 'title': 'Requirement Understanding', 'desc': 'Deep dive into client needs and project scope'},
      {'num': '02', 'title': 'Planning & Estimation', 'desc': 'Detailed BOQ, cost estimation & resource planning'},
      {'num': '03', 'title': 'Resource Mobilization', 'desc': 'Deploy skilled labour & procure materials'},
      {'num': '04', 'title': 'Execution with Supervision', 'desc': 'On-site execution under expert supervision'},
      {'num': '05', 'title': 'Timely Completion & Handover', 'desc': 'Quality check, testing & successful handover'},
    ];

    if (isMobile) {
      return Column(
        children: steps.map((step) => _buildStep(context, step, false)).toList(),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: steps.map((step) {
        final isLast = step['num'] == '05';
        return Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildStep(context, step, true)),
              if (!isLast)
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Icon(Icons.arrow_forward_ios,
                      color: AppColor.primary.withOpacity(0.3), size: 16),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStep(BuildContext context, Map<String, String> step, bool compact) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: HoverCard(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColor.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColor.primary.withOpacity(0.1)),
          ),
          child: Column(
            crossAxisAlignment: compact ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  step['num']!,
                  style: const TextStyle(
                    color: AppColor.secondary,
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                step['title']!,
                textAlign: compact ? TextAlign.center : TextAlign.start,
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: RFont.size(context, 13, desktop: 14),
                  fontWeight: FontWeight.w800,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                step['desc']!,
                textAlign: compact ? TextAlign.center : TextAlign.start,
                style: TextStyle(
                  color: AppColor.subtitle,
                  fontSize: RFont.size(context, 11, desktop: 12),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTestimonialCard(
      BuildContext context, {
        required String name,
        required String role,
        required String review,
      }) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      tween: Tween(begin: 0.95, end: 1),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColor.primary.withOpacity(0.08),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.format_quote_rounded,
              color: AppColor.secondary.withOpacity(0.7),
              size: 34,
            ),

            const SizedBox(height: 14),

            Text(
              review,
              style: TextStyle(
                color: AppColor.subtitle,
                fontSize: RFont.size(
                  context,
                  13,
                  desktop: 14,
                ),
                height: 1.7,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    name[0],
                    style: const TextStyle(
                      color: AppColor.secondary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: AppColor.primary,
                        fontSize: RFont.size(
                          context,
                          13,
                          desktop: 14,
                        ),
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      role,
                      style: TextStyle(
                        color: AppColor.subtitle,
                        fontSize: RFont.size(
                          context,
                          11,
                          desktop: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
