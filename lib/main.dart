import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const SaahayakApp());
}

// ============================================================
// SAAHAYAK — NEXT LEVEL UI
// ============================================================

class SaahayakApp extends StatelessWidget {
  const SaahayakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SAAHAYAK',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF4F8F5),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF287F76),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// ============================================================
// COLORS
// ============================================================

const Color forest = Color(0xFF174D48);
const Color teal = Color(0xFF287F76);
const Color mint = Color(0xFFDCEFE9);
const Color paleMint = Color(0xFFEDF7F3);
const Color cream = Color(0xFFF8F5EC);
const Color sand = Color(0xFFEDE5D3);
const Color ink = Color(0xFF193331);
const Color muted = Color(0xFF687A77);
const Color lavender = Color(0xFFE9E8F4);
const Color sky = Color(0xFFE4F0F3);
const Color amber = Color(0xFFF6E7C5);

// ============================================================
// APP SHELL
// ============================================================

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F5),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1250),
            child: child,
          ),
        ),
      ),
    );
  }
}

// ============================================================
// TOP BRAND
// ============================================================

class BrandHeader extends StatelessWidget {
  final bool showBack;

  const BrandHeader({
    super.key,
    this.showBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showBack)
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _CircleIconButton(
              icon: Icons.arrow_back_rounded,
              onTap: () => Navigator.pop(context),
            ),
          ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: mint,
            borderRadius: BorderRadius.circular(17),
          ),
          child: const Icon(
            Icons.psychology_alt_rounded,
            color: teal,
            size: 29,
          ),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SAAHAYAK',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
                color: forest,
              ),
            ),
            Text(
              'Your gentle cognitive companion',
              style: TextStyle(
                fontSize: 11,
                color: muted,
              ),
            ),
          ],
        ),
        const Spacer(),
        _StatusPill(),
      ],
    );
  }
}

class _StatusPill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xFFDCE8E4),
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.wifi_rounded,
            size: 15,
            color: Color(0xFF4E9271),
          ),
          SizedBox(width: 6),
          Text(
            'Ready',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: forest,
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: SizedBox(
          width: 46,
          height: 46,
          child: Icon(
            icon,
            color: ink,
            size: 23,
          ),
        ),
      ),
    );
  }
}

// ============================================================
// HOME SCREEN
// ============================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 24, 30, 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BrandHeader(),

            const SizedBox(height: 38),

            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 850) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: _WelcomeSection(),
                      ),
                      const SizedBox(width: 45),
                      Expanded(
                        flex: 4,
                        child: _CompanionVisual(),
                      ),
                    ],
                  );
                }

                return Column(
                  children: const [
                    _WelcomeSection(),
                    SizedBox(height: 25),
                    _CompanionVisual(),
                  ],
                );
              },
            ),

            const SizedBox(height: 45),

            _SectionHeading(
              eyebrow: 'TODAY WITH SAAHAYAK',
              title: 'A few gentle moments for you',
              subtitle:
                  'Choose what feels comfortable. SAAHAYAK will adapt along the way.',
            ),

            const SizedBox(height: 20),

            LayoutBuilder(
              builder: (context, constraints) {
                final wide = constraints.maxWidth > 750;

                if (wide) {
                  return Row(
                    children: [
                      Expanded(
                        child: _JourneyStep(
                          number: '01',
                          icon: Icons.psychology_rounded,
                          title: 'Remember',
                          subtitle: 'Exercise memory',
                          color: mint,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _JourneyStep(
                          number: '02',
                          icon: Icons.auto_awesome_rounded,
                          title: 'Adapt',
                          subtitle: 'Learn from you',
                          color: lavender,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _JourneyStep(
                          number: '03',
                          icon: Icons.favorite_outline_rounded,
                          title: 'Support',
                          subtitle: 'Help with your day',
                          color: amber,
                        ),
                      ),
                    ],
                  );
                }

                return Column(
                  children: [
                    _JourneyStep(
                      number: '01',
                      icon: Icons.psychology_rounded,
                      title: 'Remember',
                      subtitle: 'Exercise memory',
                      color: mint,
                    ),
                    const SizedBox(height: 10),
                    _JourneyStep(
                      number: '02',
                      icon: Icons.auto_awesome_rounded,
                      title: 'Adapt',
                      subtitle: 'Learn from you',
                      color: lavender,
                    ),
                    const SizedBox(height: 10),
                    _JourneyStep(
                      number: '03',
                      icon: Icons.favorite_outline_rounded,
                      title: 'Support',
                      subtitle: 'Help with your day',
                      color: amber,
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 25),

            _BottomNavigationArea(),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// WELCOME
// ============================================================

class _WelcomeSection extends StatelessWidget {
  const _WelcomeSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: mint,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            'GOOD MORNING',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
              color: forest,
            ),
          ),
        ),

        const SizedBox(height: 18),

        const Text(
          'Shall we remember\nsomething together?',
          style: TextStyle(
            fontSize: 40,
            height: 1.08,
            fontWeight: FontWeight.w800,
            color: ink,
          ),
        ),

        const SizedBox(height: 15),

        const Text(
          'Take a few peaceful minutes for yourself today. '
          'There is no rush — SAAHAYAK is here to help.',
          style: TextStyle(
            fontSize: 17,
            height: 1.55,
            color: muted,
          ),
        ),

        const SizedBox(height: 24),

        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 62,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ActivitySelectionScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.play_arrow_rounded,
                    size: 26,
                  ),
                  label: const Text(
                    'Begin Today',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: forest,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            _CircleIconButton(
              icon: Icons.volume_up_rounded,
              onTap: () {},
            ),
          ],
        ),

        const SizedBox(height: 12),

        const Row(
          children: [
            Icon(
              Icons.favorite_border_rounded,
              size: 16,
              color: teal,
            ),
            SizedBox(width: 6),
            Text(
              'You can take your time.',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: muted,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ============================================================
// COMPANION VISUAL
// ============================================================

class _CompanionVisual extends StatelessWidget {
  const _CompanionVisual();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(42),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE0F0EA),
            Color(0xFFCDE4DD),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -50,
            right: -40,
            child: _Blob(
              size: 190,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          Positioned(
            bottom: -70,
            left: -40,
            child: _Blob(
              size: 190,
              color: const Color(0xFF9EC8BB).withOpacity(0.35),
            ),
          ),

          // Mountains
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 150,
              child: CustomPaint(
                painter: _MountainPainter(),
              ),
            ),
          ),

          // Brain companion
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 145,
                  height: 145,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.88),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: forest.withOpacity(0.12),
                        blurRadius: 35,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.psychology_alt_rounded,
                    size: 82,
                    color: teal,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.82),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'I am here with you',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: forest,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Blob extends StatelessWidget {
  final double size;
  final Color color;

  const _Blob({
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _MountainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF8BB9AC).withOpacity(0.65)
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width * 0.18, size.height * 0.45);
    path.lineTo(size.width * 0.33, size.height * 0.75);
    path.lineTo(size.width * 0.52, size.height * 0.25);
    path.lineTo(size.width * 0.73, size.height * 0.68);
    path.lineTo(size.width * 0.87, size.height * 0.43);
    path.lineTo(size.width, size.height * 0.65);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);

    final secondPaint = Paint()
      ..color = const Color(0xFF6F9F92).withOpacity(0.35);

    final path2 = Path();

    path2.moveTo(0, size.height);
    path2.lineTo(size.width * 0.28, size.height * 0.65);
    path2.lineTo(size.width * 0.48, size.height * 0.78);
    path2.lineTo(size.width * 0.67, size.height * 0.52);
    path2.lineTo(size.width, size.height * 0.72);
    path2.lineTo(size.width, size.height);
    path2.close();

    canvas.drawPath(path2, secondPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ============================================================
// SECTION HEADING
// ============================================================

class _SectionHeading extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String subtitle;

  const _SectionHeading({
    required this.eyebrow,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
            color: teal,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
            color: ink,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: muted,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// JOURNEY STEP
// ============================================================

class _JourneyStep extends StatelessWidget {
  final String number;
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const _JourneyStep({
    required this.number,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.82),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Icon(
              icon,
              color: forest,
              size: 27,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  number,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: muted,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: ink,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: muted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// BOTTOM NAVIGATION AREA
// ============================================================

class _BottomNavigationArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _BottomAction(
            icon: Icons.notifications_none_rounded,
            title: 'My Day',
            subtitle: 'Reminders',
            color: cream,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MemoryAssistanceScreen(),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: _BottomAction(
            icon: Icons.people_outline_rounded,
            title: 'Family',
            subtitle: 'Caregiver view',
            color: sky,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CaregiverDashboard(),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: _BottomAction(
            icon: Icons.insights_outlined,
            title: 'My Journey',
            subtitle: 'Progress',
            color: lavender,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProgressScreen(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _BottomAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _BottomAction({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 17,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: forest,
                size: 25,
              ),
              const SizedBox(width: 11),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: ink,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 11,
                        color: muted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// ACTIVITY SELECTION
// ============================================================

class ActivitySelectionScreen extends StatelessWidget {
  const ActivitySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 24, 30, 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BrandHeader(showBack: true),
            const SizedBox(height: 38),

            const Text(
              'What would you like\nto remember today?',
              style: TextStyle(
                fontSize: 37,
                height: 1.1,
                fontWeight: FontWeight.w800,
                color: ink,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'SAAHAYAK has chosen one activity especially for you.',
              style: TextStyle(
                fontSize: 16,
                color: muted,
              ),
            ),

            const SizedBox(height: 28),

            // RECOMMENDED ACTIVITY
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MemoryRecallScreen(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(26),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF1A5650),
                      Color(0xFF2E897E),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 105,
                      height: 105,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.psychology_rounded,
                        color: Colors.white,
                        size: 57,
                      ),
                    ),
                    const SizedBox(width: 23),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TODAY'S RECOMMENDATION",
                            style: TextStyle(
                              fontSize: 10,
                              letterSpacing: 1.3,
                              fontWeight: FontWeight.w900,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 9),
                          Text(
                            'Memory Recall',
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Remember familiar things and see how SAAHAYAK adapts.',
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.4,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 29,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            const Text(
              'Other gentle activities',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: ink,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: _LargeActivity(
                    icon: Icons.visibility_outlined,
                    title: 'Attention',
                    subtitle: 'Find what changed',
                    color: sky,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _LargeActivity(
                    icon: Icons.extension_outlined,
                    title: 'Match',
                    subtitle: 'Remember & retrieve',
                    color: lavender,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            _LargeActivity(
              icon: Icons.format_list_numbered_rounded,
              title: 'Life Sequence',
              subtitle: 'Put familiar everyday moments in order',
              color: cream,
            ),
          ],
        ),
      ),
    );
  }
}

class _LargeActivity extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const _LargeActivity({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 31,
            color: forest,
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: ink,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: muted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// MEMORY RECALL
// ============================================================

class MemoryRecallScreen extends StatefulWidget {
  const MemoryRecallScreen({super.key});

  @override
  State<MemoryRecallScreen> createState() => _MemoryRecallScreenState();
}

class _MemoryRecallScreenState extends State<MemoryRecallScreen> {
  Timer? timer;
  int seconds = 5;

  final items = const [
    _MemoryObject(
      name: 'Flower',
      icon: Icons.local_florist_rounded,
    ),
    _MemoryObject(
      name: 'Cup',
      icon: Icons.local_cafe_rounded,
    ),
    _MemoryObject(
      name: 'Bicycle',
      icon: Icons.pedal_bike_rounded,
    ),
    _MemoryObject(
      name: 'Music',
      icon: Icons.music_note_rounded,
    ),
  ];

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (seconds > 0) {
          setState(() {
            seconds--;
          });
        } else {
          timer?.cancel();
        }
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 24, 30, 30),
        child: Column(
          children: [
            const BrandHeader(showBack: true),
            const SizedBox(height: 25),

            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Memory Journey',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: ink,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Take your time. Look at these familiar things.',
                        style: TextStyle(
                          fontSize: 15,
                          color: muted,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 11,
                  ),
                  decoration: BoxDecoration(
                    color: mint,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    seconds > 0 ? '$seconds sec' : 'Ready',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: forest,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final columns = constraints.maxWidth > 800 ? 4 : 2;

                  return GridView.builder(
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return _MemoryObjectTile(
                        item: items[index],
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 18),

            SizedBox(
              width: double.infinity,
              height: 64,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RecallQuestionScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: forest,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'I Remember',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MemoryObject {
  final String name;
  final IconData icon;

  const _MemoryObject({
    required this.name,
    required this.icon,
  });
}

class _MemoryObjectTile extends StatelessWidget {
  final _MemoryObject item;

  const _MemoryObjectTile({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xFFE0EAE6),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              color: paleMint,
              shape: BoxShape.circle,
            ),
            child: Icon(
              item.icon,
              color: teal,
              size: 48,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            item.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: ink,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// RECALL QUESTION
// ============================================================

class RecallQuestionScreen extends StatefulWidget {
  const RecallQuestionScreen({super.key});

  @override
  State<RecallQuestionScreen> createState() =>
      _RecallQuestionScreenState();
}

class _RecallQuestionScreenState
    extends State<RecallQuestionScreen> {
  final Set<String> selected = {};
  final Stopwatch stopwatch = Stopwatch();

  final correctItems = const [
    'Flower',
    'Cup',
    'Bicycle',
    'Music',
  ];

  final options = const [
    _QuestionOption('Flower', Icons.local_florist_rounded),
    _QuestionOption('Cup', Icons.local_cafe_rounded),
    _QuestionOption('Bicycle', Icons.pedal_bike_rounded),
    _QuestionOption('Music', Icons.music_note_rounded),
    _QuestionOption('Book', Icons.menu_book_rounded),
    _QuestionOption('Clock', Icons.access_time_rounded),
    _QuestionOption('Tree', Icons.park_rounded),
    _QuestionOption('Umbrella', Icons.umbrella_rounded),
  ];

  @override
  void initState() {
    super.initState();
    stopwatch.start();
  }

  @override
  void dispose() {
    stopwatch.stop();
    super.dispose();
  }

  void submit() {
    stopwatch.stop();

    int correct = 0;

    for (final answer in selected) {
      if (correctItems.contains(answer)) {
        correct++;
      }
    }

    final accuracy =
        ((correct / correctItems.length) * 100).round();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PerformanceScreen(
          accuracy: accuracy,
          responseSeconds: stopwatch.elapsed.inSeconds,
          correctCount: correct,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 24, 30, 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BrandHeader(showBack: true),

            const SizedBox(height: 35),

            const Text(
              'Which things\ndo you remember?',
              style: TextStyle(
                fontSize: 38,
                height: 1.08,
                fontWeight: FontWeight.w800,
                color: ink,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Tap everything you saw. There is no rush.',
              style: TextStyle(
                fontSize: 16,
                color: muted,
              ),
            ),

            const SizedBox(height: 25),

            LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth > 800 ? 4 : 2;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1.15,
                  ),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options[index];
                    final isSelected =
                        selected.contains(option.name);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selected.remove(option.name);
                          } else {
                            selected.add(option.name);
                          }
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? mint
                              : Colors.white,
                          borderRadius:
                              BorderRadius.circular(25),
                          border: Border.all(
                            color: isSelected
                                ? teal
                                : const Color(0xFFE2EAE7),
                            width: isSelected ? 2.5 : 1,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    option.icon,
                                    size: 43,
                                    color: isSelected
                                        ? teal
                                        : muted,
                                  ),
                                  const SizedBox(height: 9),
                                  Text(
                                    option.name,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight:
                                          FontWeight.w700,
                                      color: ink,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (isSelected)
                              const Positioned(
                                top: 12,
                                right: 12,
                                child: Icon(
                                  Icons.check_circle_rounded,
                                  color: teal,
                                  size: 25,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 64,
              child: ElevatedButton(
                onPressed: selected.isEmpty ? null : submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: forest,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor:
                      const Color(0xFFD9E1DE),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.volume_up_outlined),
                label: const Text(
                  'Hear the question',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuestionOption {
  final String name;
  final IconData icon;

  const _QuestionOption(
    this.name,
    this.icon,
  );
}

// ============================================================
// PERFORMANCE
// ============================================================

class PerformanceScreen extends StatelessWidget {
  final int accuracy;
  final int responseSeconds;
  final int correctCount;

  const PerformanceScreen({
    super.key,
    required this.accuracy,
    required this.responseSeconds,
    required this.correctCount,
  });

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 24, 30, 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BrandHeader(showBack: true),

            const SizedBox(height: 35),

            Center(
              child: Container(
                width: 145,
                height: 145,
                decoration: BoxDecoration(
                  color: mint,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFC9E2D9),
                    width: 8,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$accuracy%',
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: forest,
                      ),
                    ),
                    const Text(
                      'memory',
                      style: TextStyle(
                        fontSize: 12,
                        color: muted,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Center(
              child: Text(
                'That was a good moment.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: ink,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Center(
              child: Text(
                'You remembered $correctCount out of 4 things.',
                style: const TextStyle(
                  fontSize: 16,
                  color: muted,
                ),
              ),
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: _ResultMetric(
                    icon: Icons.psychology_rounded,
                    label: 'Accuracy',
                    value: '$accuracy%',
                    color: mint,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ResultMetric(
                    icon: Icons.timer_outlined,
                    label: 'Response',
                    value: '${responseSeconds}s',
                    color: sky,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: _ResultMetric(
                    icon: Icons.replay_rounded,
                    label: 'Attempts',
                    value: '1',
                    color: amber,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(27),
                border: Border.all(
                  color: const Color(0xFFE1E9E5),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.auto_awesome_rounded,
                        color: teal,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'SAAHAYAK noticed',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: ink,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Your response becomes part of your personal activity pattern. SAAHAYAK uses this information to shape what comes next.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: muted,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 64,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PersonalizationScreen(
                        accuracy: accuracy,
                        responseSeconds: responseSeconds,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: forest,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'See what comes next',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward_rounded),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultMetric extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _ResultMetric({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 17,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: forest,
            size: 25,
          ),
          const SizedBox(height: 7),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: ink,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: muted,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PERSONALIZATION — MAIN USP SCREEN
// ============================================================

class PersonalizationScreen extends StatelessWidget {
  final int accuracy;
  final int responseSeconds;

  const PersonalizationScreen({
    super.key,
    required this.accuracy,
    required this.responseSeconds,
  });

  @override
  Widget build(BuildContext context) {
    final strong =
        accuracy >= 75 && responseSeconds <= 15;

    final needsSupport =
        accuracy < 50 || responseSeconds > 20;

    final title = strong
        ? 'A little more challenge'
        : needsSupport
            ? 'A little more support'
            : 'A comfortable next step';

    final level = strong
        ? 'Memory Recall • Level 2'
        : needsSupport
            ? 'Memory Recall • Supported'
            : 'Memory Recall • Level 1';

    final explanation = strong
        ? 'Your memory response was comfortable, so SAAHAYAK is gently increasing the challenge.'
        : needsSupport
            ? 'SAAHAYAK noticed that a little extra support may make the next activity more comfortable.'
            : 'SAAHAYAK is keeping the activity balanced and gradually adapting it to you.';

    return AppShell(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 24, 30, 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BrandHeader(showBack: true),

            const SizedBox(height: 35),

            const Text(
              'SAAHAYAK\nlearned something.',
              style: TextStyle(
                fontSize: 38,
                height: 1.08,
                fontWeight: FontWeight.w800,
                color: ink,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Your next experience is now being personalized.',
              style: TextStyle(
                fontSize: 16,
                color: muted,
              ),
            ),

            const SizedBox(height: 30),

            // VISUAL LOOP
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFE0F1EB),
                    Color(0xFFF1F4ED),
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _LoopNode(
                          icon: Icons.person_outline_rounded,
                          title: 'You',
                          subtitle: 'Your response',
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        color: teal,
                      ),
                      Expanded(
                        child: _LoopNode(
                          icon: Icons.psychology_alt_rounded,
                          title: 'SAAHAYAK',
                          subtitle: 'Learns',
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        color: teal,
                      ),
                      Expanded(
                        child: _LoopNode(
                          icon: Icons.auto_awesome_rounded,
                          title: 'Next',
                          subtitle: 'Adapts',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: forest,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'YOUR NEXT EXPERIENCE',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w900,
                      color: Colors.white60,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    level,
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFD7EFE7),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    explanation,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // SIGNALS
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(27),
                border: Border.all(
                  color: const Color(0xFFE1E9E5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What SAAHAYAK considered',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: ink,
                    ),
                  ),
                  const SizedBox(height: 18),
                  _Signal(
                    icon: Icons.check_circle_outline_rounded,
                    title: 'Accuracy',
                    value: '$accuracy%',
                  ),
                  _Signal(
                    icon: Icons.timer_outlined,
                    title: 'Response time',
                    value: '$responseSeconds sec',
                  ),
                  const _Signal(
                    icon: Icons.history_rounded,
                    title: 'Previous sessions',
                    value: 'Pattern',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            Center(
              child: Column(
                children: const [
                  Text(
                    'SAME GAME.',
                    style: TextStyle(
                      fontSize: 13,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w900,
                      color: teal,
                    ),
                  ),
                  Text(
                    'DIFFERENT EXPERIENCE.',
                    style: TextStyle(
                      fontSize: 21,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w900,
                      color: forest,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            SizedBox(
              width: double.infinity,
              height: 64,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const MemoryAssistanceScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: forest,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Continue to My Support',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoopNode extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _LoopNode({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: teal,
            size: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            color: ink,
          ),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 10,
            color: muted,
          ),
        ),
      ],
    );
  }
}

class _Signal extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _Signal({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Icon(
            icon,
            color: teal,
            size: 23,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: muted,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: ink,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// MEMORY ASSISTANCE
// ============================================================

class MemoryAssistanceScreen extends StatelessWidget {
  const MemoryAssistanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 24, 30, 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BrandHeader(showBack: true),

            const SizedBox(height: 35),

            const Text(
              'Your day,\nwith a little help.',
              style: TextStyle(
                fontSize: 38,
                height: 1.08,
                fontWeight: FontWeight.w800,
                color: ink,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Simple reminders for the moments that matter.',
              style: TextStyle(
                fontSize: 16,
                color: muted,
              ),
            ),

            const SizedBox(height: 28),

            _Reminder(
              time: '10:30',
              period: 'AM',
              title: 'Drink some water',
              icon: Icons.water_drop_outlined,
              color: sky,
            ),

            _Reminder(
              time: '12:00',
              period: 'PM',
              title: 'Medication reminder',
              icon: Icons.medication_outlined,
              color: mint,
            ),

            _Reminder(
              time: '04:00',
              period: 'PM',
              title: 'Family appointment',
              icon: Icons.people_outline_rounded,
              color: cream,
            ),

            const SizedBox(height: 18),

            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: forest,
                borderRadius: BorderRadius.circular(27),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.wifi_off_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      'Offline support is ready. Your reminders and saved activities can continue with limited connectivity.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.45,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 60,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_rounded),
                label: const Text(
                  'Add a reminder',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: forest,
                  side: const BorderSide(
                    color: Color(0xFFBFD3CD),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Reminder extends StatelessWidget {
  final String time;
  final String period;
  final String title;
  final IconData icon;
  final Color color;

  const _Reminder({
    required this.time,
    required this.period,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 82,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: ink,
                  ),
                ),
                Text(
                  period,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: muted,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: forest,
              size: 27,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: ink,
              ),
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: forest,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PROGRESS
// ============================================================

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 24, 30, 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BrandHeader(showBack: true),

            const SizedBox(height: 35),

            const Text(
              'Your journey,\none day at a time.',
              style: TextStyle(
                fontSize: 38,
                height: 1.08,
                fontWeight: FontWeight.w800,
                color: ink,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'SAAHAYAK looks at patterns across your sessions.',
              style: TextStyle(
                fontSize: 16,
                color: muted,
              ),
            ),

            const SizedBox(height: 28),

            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF174D48),
                    Color(0xFF287F76),
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 125,
                    height: 125,
                    child: CustomPaint(
                      painter: _ProgressCirclePainter(),
                      child: const Center(
                        child: Text(
                          '82%',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 22),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Memory Recall',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Your recent activity pattern',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(height: 14),
                        Text(
                          'Mon  •  Tue  •  Wed  •  Thu  •  Fri',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const _ProgressCategory(
              title: 'Memory',
              value: 0.82,
              percentage: '82%',
              color: mint,
            ),

            const _ProgressCategory(
              title: 'Attention',
              value: 0.74,
              percentage: '74%',
              color: sky,
            ),

            const _ProgressCategory(
              title: 'Recall',
              value: 0.78,
              percentage: '78%',
              color: lavender,
            ),

            const _ProgressCategory(
              title: 'Sequencing',
              value: 0.68,
              percentage: '68%',
              color: cream,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressCategory extends StatelessWidget {
  final String title;
  final double value;
  final String percentage;
  final Color color;

  const _ProgressCategory({
    required this.title,
    required this.value,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 11),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 82,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: ink,
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: value,
                minHeight: 10,
                backgroundColor:
                    Colors.white.withOpacity(0.6),
                valueColor:
                    const AlwaysStoppedAnimation<Color>(
                  forest,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Text(
            percentage,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: ink,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius = size.width / 2 - 8;

    final background = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9;

    final foreground = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 9;

    canvas.drawCircle(
      center,
      radius,
      background,
    );

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      -math.pi / 2,
      math.pi * 2 * 0.82,
      false,
      foreground,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      false;
}

// ============================================================
// CAREGIVER DASHBOARD
// ============================================================

class CaregiverDashboard extends StatelessWidget {
  const CaregiverDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 24, 30, 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BrandHeader(showBack: true),

            const SizedBox(height: 35),

            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Caregiver view',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          color: ink,
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        'Meaningful signals, not overwhelming data.',
                        style: TextStyle(
                          fontSize: 15,
                          color: muted,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 65,
                  height: 65,
                  decoration: const BoxDecoration(
                    color: mint,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.people_alt_outlined,
                    color: forest,
                    size: 31,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            Row(
              children: const [
                Expanded(
                  child: _CareMetric(
                    title: 'Sessions',
                    value: '4',
                    icon: Icons.play_circle_outline_rounded,
                    color: mint,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _CareMetric(
                    title: 'Avg. Accuracy',
                    value: '82%',
                    icon: Icons.insights_rounded,
                    color: sky,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _CareMetric(
                    title: 'Activities',
                    value: '3',
                    icon: Icons.extension_outlined,
                    color: lavender,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(27),
                border: Border.all(
                  color: const Color(0xFFE0E8E4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recent observation',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: ink,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: paleMint,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.visibility_outlined,
                          color: teal,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Recall performance was better than the previous session.',
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.4,
                              color: ink,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: forest,
                borderRadius: BorderRadius.circular(27),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'LONGITUDINAL VIEW',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w900,
                      color: Colors.white60,
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    'Pattern across recent sessions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: CustomPaint(
                      painter: _TrendPainter(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: amber,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.notifications_none_rounded,
                    color: forest,
                    size: 27,
                  ),
                  SizedBox(width: 13),
                  Expanded(
                    child: Text(
                      'No meaningful alerts require attention right now.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: ink,
                      ),
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
}

class _CareMetric extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _CareMetric({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: forest,
            size: 25,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w900,
              color: ink,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              color: muted,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// TREND GRAPH
// ============================================================

class _TrendPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..strokeWidth = 1;

    for (int i = 1; i < 4; i++) {
      final y = size.height * i / 4;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        gridPaint,
      );
    }

    final linePaint = Paint()
      ..color = const Color(0xFFB9E2D5)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final pointPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final points = [
      Offset(10, size.height * 0.74),
      Offset(size.width * 0.23, size.height * 0.61),
      Offset(size.width * 0.46, size.height * 0.66),
      Offset(size.width * 0.69, size.height * 0.40),
      Offset(size.width - 10, size.height * 0.24),
    ];

    final path = Path();
    path.moveTo(
      points.first.dx,
      points.first.dy,
    );

    for (int i = 1; i < points.length; i++) {
      path.lineTo(
        points[i].dx,
        points[i].dy,
      );
    }

    canvas.drawPath(path, linePaint);

    for (final point in points) {
      canvas.drawCircle(point, 6, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      false;
}