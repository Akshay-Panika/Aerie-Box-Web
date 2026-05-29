import 'package:flutter/material.dart';
import '../utils/app_color.dart';
import '../utils/screen_helper.dart';
import '../utils/r_font.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ScreenHelper.isMobile(context);
        final isTablet = ScreenHelper.isTablet(context);

        return Container(
          color: AppColor.surface,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : (isTablet ? 60 : 120),
            vertical: isMobile ? 50 : 80,
          ),
          child: Column(
            children: [
              _buildSectionLabel(context),
              const SizedBox(height: 12),
              _buildTitle(context),
              const SizedBox(height: 40),
              isMobile
                  ? _buildMobileContent(context)
                  : _buildDesktopContent(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionLabel(BuildContext context) {
    return Text(
      'WHO WE ARE',
      style: TextStyle(
        color: AppColor.secondary,
        fontSize: RFont.size(context, 11, desktop: 12),
        fontWeight: FontWeight.w700,
        letterSpacing: 3,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'About Ravita Nexus EPC Solutions',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColor.primary,
        fontSize: RFont.size(context, 22, tablet: 28, desktop: 36),
        fontWeight: FontWeight.w800,
        height: 1.2,
      ),
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return Column(
      children: [
        _buildDescription(context),
        const SizedBox(height: 32),
        _buildVisionMission(context),
      ],
    );
  }

  Widget _buildDesktopContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: _buildDescription(context)),
        const SizedBox(width: 60),
        Expanded(flex: 5, child: _buildVisionMission(context)),
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ravita Nexus EPC Solutions is a fast-growing EPC (Engineering, Procurement & Construction) firm delivering reliable and result-oriented solutions in electrical and infrastructure projects.',
          style: TextStyle(
            color: AppColor.subtitle,
            fontSize: RFont.size(context, 14, desktop: 16),
            height: 1.7,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'We specialize in efficient execution, cost control, and timely delivery, ensuring every project meets the highest standards of quality, safety, and performance.',
          style: TextStyle(
            color: AppColor.subtitle,
            fontSize: RFont.size(context, 14, desktop: 16),
            height: 1.7,
          ),
        ),
        const SizedBox(height: 28),
        ...[
          'Practical, site-oriented execution approach',
          'Cost-effective solutions',
          'Fast decision-making',
          'Client-focused working style',
        ].map((point) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 6),
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColor.secondary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  point,
                  style: TextStyle(
                    color: AppColor.title,
                    fontSize: RFont.size(context, 13, desktop: 15),
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildVisionMission(BuildContext context) {
    return Column(
      children: [
        _buildCard(
          context,
          icon: Icons.visibility_outlined,
          title: 'Our Vision',
          content: 'To become a trusted name in EPC contracting by delivering consistent quality, dependable execution, and long-term value.',
        ),
        const SizedBox(height: 20),
        _buildCard(
          context,
          icon: Icons.flag_outlined,
          title: 'Our Mission',
          content: '',
          points: [
            'Execute with precision & accountability',
            'Build trust & transparency',
            'Deliver on time without compromise',
          ],
        ),
      ],
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String content,
    List<String>? points,
  }) {
    return HoverCard(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColor.primary.withOpacity(0.07),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColor.secondary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: AppColor.secondary, size: 22),
                ),
                const SizedBox(width: 14),
                Text(
                  title,
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: RFont.size(context, 16, desktop: 18),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            if (content.isNotEmpty)
              Text(
                content,
                style: TextStyle(
                  color: AppColor.subtitle,
                  fontSize: RFont.size(context, 13, desktop: 14),
                  height: 1.6,
                ),
              ),
            if (points != null)
              ...points.map((p) => Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('✔ ', style: TextStyle(color: AppColor.success, fontSize: 13)),
                    Expanded(
                      child: Text(
                        p,
                        style: TextStyle(
                          color: AppColor.subtitle,
                          fontSize: RFont.size(context, 13, desktop: 14),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          ],
        ),
      ),
    );
  }

}

class HoverCard extends StatefulWidget {
  final Widget child;

  const HoverCard({
    super.key,
    required this.child,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        transform: Matrix4.identity()
          ..translate(0.0, isHover ? -4 : 0.0)
          ..scale(isHover ? 1.01 : 1.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          // padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isHover
                  ? AppColor.primary.withOpacity(0.3)
                  : Colors.transparent,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                  isHover ? 0.08 : 0.04,
                ),
                blurRadius: isHover ? 18 : 10,
                spreadRadius: 0,
                offset: Offset(0, isHover ? 8 : 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
