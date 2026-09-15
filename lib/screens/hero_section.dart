import 'package:flutter/material.dart';
import '../utils/app_color.dart';
import '../utils/screen_helper.dart';
import '../utils/r_font.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onContactTap;

  const HeroSection({super.key, required this.onContactTap});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {

  late final AnimationController _controller;

  late final Animation<int> _projectAnimation;
  late final Animation<int> _lineAnimation;
  late final Animation<int> _deliveryAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _projectAnimation = IntTween(
      begin: 0,
      end: 100,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _lineAnimation = IntTween(
      begin: 0,
      end: 33,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _deliveryAnimation = IntTween(
      begin: 0,
      end: 100,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ScreenHelper.isMobile(context);
        final isTablet = ScreenHelper.isTablet(context);

        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.primary,
                Colors.blue
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : (isTablet ? 60 : 100),
            vertical: isMobile ? 20 : 40,
          ),
          child: isMobile
              ? _buildMobileLayout(context)
              : _buildDesktopLayout(context),
        );
      },
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBadge(),
        const SizedBox(height: 20),
        _buildHeadline(context),
        const SizedBox(height: 16),
        _buildTagline(context),
        const SizedBox(height: 16),
        _buildExtraContent(context),
        const SizedBox(height: 32),
        _buildButtons(context),
        const SizedBox(height: 40),
        _buildStatsRow(context),
        const SizedBox(height: 30),
        _buildHeroGraphic(context),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBadge(),
                  const SizedBox(height: 24),
                  _buildHeadline(context),
                  const SizedBox(height: 18),
                  _buildTagline(context),
                  const SizedBox(height: 18),
                  _buildExtraContent(context),
                  const SizedBox(height: 40),
                  _buildButtons(context),
                  const SizedBox(height: 60),
                  _buildStatsRow(context),
                ],
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              flex: 4,
              child: _buildHeroGraphic(context),
            ),
          ],
        ),
        const SizedBox(height: 0),
      ],
    );
  }

  Widget _buildBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColor.secondary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.secondary.withOpacity(0.4)),
      ),
      child: const Text(
        '⚡ Rental Service Excellence',
        style: TextStyle(
          color: AppColor.secondary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildHeadline(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'AERIE BOX\n',
            style: TextStyle(
              color: AppColor.white,
              fontSize: RFont.size(context, 32, tablet: 42, desktop: 56),
              fontWeight: FontWeight.w900,
              height: 1.1,
              letterSpacing: -1,
            ),
          ),
          TextSpan(
            text: 'Room Rentals',
            style: TextStyle(
              color: AppColor.secondary,
              fontSize: RFont.size(context, 32, tablet: 42, desktop: 46),
              fontWeight: FontWeight.w900,
              height: 1.1,
              letterSpacing: -1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTagline(BuildContext context) {
    return Text(
      '"Bharosa aur nateeja—dono guaranteed."',
      style: TextStyle(
        color: AppColor.white.withOpacity(0.8),
        fontSize: RFont.size(context, 14, tablet: 16, desktop: 18),
        fontStyle: FontStyle.italic,
        height: 1.5,
      ),
    );
  }

  /// ✅ NAYA CONTENT — 3 lines add ki gayi hain
  Widget _buildExtraContent(BuildContext context) {
    final lines = [
      'Comfortable & fully furnished rental rooms for students, professionals and families.',
      'Easy booking, transparent pricing and zero hidden charges — har baar.',
      'Safe, secure and well-maintained accommodation with 24/7 tenant support.',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((line) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 7),
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
                  line,
                  style: TextStyle(
                    color: AppColor.white.withOpacity(0.75),
                    fontSize: RFont.size(context, 13, desktop: 15),
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 12,
      children: [
        ElevatedButton(
          onPressed: widget.onContactTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.secondary,
            foregroundColor: AppColor.white,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          child: Text(
            'Get In Touch',
            style: TextStyle(
              fontSize: RFont.size(context, 13, desktop: 15),
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        OutlinedButton(
          onPressed: widget.onContactTap,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColor.white,
            side: const BorderSide(color: AppColor.white, width: 1.5),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Our Services',
            style: TextStyle(
              fontSize: RFont.size(context, 13, desktop: 15),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final stats = [
          {
            'value': '${_projectAnimation.value}+',
            'label': 'Rooms Listed'
          },
          {
            'value': '${_lineAnimation.value}kV',
            'label': 'App Downloader'
          },
          {
            'value': '${_deliveryAnimation.value}%',
            'label': 'Happy Tenants'
          },
        ];

        return Wrap(
          spacing: 32,
          runSpacing: 20,
          children: stats.map((stat) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stat['value']!,
                  style: TextStyle(
                    color: AppColor.secondary,
                    fontSize: RFont.size(context, 22, desktop: 28),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  stat['label']!,
                  style: TextStyle(
                    color: AppColor.white.withOpacity(0.6),
                    fontSize: RFont.size(context, 11, desktop: 13),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildHeroGraphic(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/aerie-banner.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 0.85,
              colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.blue.withOpacity(0.5),
                AppColor.primary,
              ],
              stops: const [0.0, 0.5, 0.85, 1.0],
            ),
          ),
        ),
      ),
    );
  }
}