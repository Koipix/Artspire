import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0; // 0 = splash, 1-3 = sliders

  @override
  void initState() {
    super.initState();
    // Auto-advance from splash after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted && _currentPage == 0) {
        setState(() {
          _currentPage = 1;
        });
      }
    });
  }

  void _nextPage() {
    if (_currentPage < 3) {
      setState(() {
        _currentPage++;
      });
    } else {
      // Go to welcome page
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _currentPage == 0 
              ? _buildSplashScreen() 
              : _buildSliderScreen(_currentPage),
        ),
      ),
    );
  }

  Widget _buildSplashScreen() {
    return SizedBox(
      key: const ValueKey('splash'),
      width: double.infinity,
      child: Column(
        children: [
          const Spacer(flex: 2),
          
          // Welcome text
          Text(
            'Welcome to',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1.33,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 32),
          
          // Logo
          SvgPicture.asset(
            'assets/icons/Logo.svg',
            height: 50,
          ),
          
          const Spacer(flex: 2),
          
          // Loading indicator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: _buildLoadingIndicator(),
          ),
          
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return SizedBox(
      height: 55,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Arc path
          CustomPaint(
            size: const Size(280, 50),
            painter: _LoadingArcPainter(),
          ),
          // Animated dot
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(seconds: 2),
            builder: (context, value, child) {
              return CustomPaint(
                size: const Size(280, 50),
                painter: _LoadingDotPainter(progress: value),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSliderScreen(int page) {
    final sliderData = _getSliderData(page);
    
    return SizedBox(
      key: ValueKey('slider_$page'),
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 8),
          
          // Progress slider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: page >= 1 
                          ? const Color(0xFF7A88F2) 
                          : const Color(0xFFC5C2D2),
                      borderRadius: BorderRadius.circular(1.5),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: page >= 2 
                          ? const Color(0xFF7A88F2) 
                          : const Color(0xFFC5C2D2),
                      borderRadius: BorderRadius.circular(1.5),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: page >= 3 
                          ? const Color(0xFF7A88F2) 
                          : const Color(0xFFC5C2D2),
                      borderRadius: BorderRadius.circular(1.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const Spacer(flex: 1),
          
          // Illustration
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SvgPicture.asset(
              sliderData['illustration']!,
              height: 300,
              fit: BoxFit.contain,
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Title text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              sliderData['title']!,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.3,
                letterSpacing: -0.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          
          const Spacer(flex: 2),
          
          // Next/Start button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: _nextPage,
              child: Container(
                width: double.infinity,
                height: 58,
                decoration: BoxDecoration(
                  color: const Color(0xFF7A88F2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    page == 3 ? 'Start' : 'Next',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Map<String, String> _getSliderData(int page) {
    switch (page) {
      case 1:
        return {
          'illustration': 'assets/icons/Illustration_1.svg',
          'title': 'Discover the finest street art masterpiece.',
        };
      case 2:
        return {
          'illustration': 'assets/icons/Illustration_2.svg',
          'title': 'Experience the creativity of diverse and distinctive paintings.',
        };
      case 3:
        return {
          'illustration': 'assets/icons/Illustration_3.svg',
          'title': 'Find the perfect offer tailored to your needs',
        };
      default:
        return {
          'illustration': 'assets/icons/Illustration_1.svg',
          'title': '',
        };
    }
  }
}

class _LoadingArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF383843)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
      size.width / 2,
      -size.height * 0.3,
      size.width,
      size.height * 0.8,
    );
    
    canvas.drawPath(path, paint);
    
    // Draw end circles
    final dotPaint = Paint()
      ..color = const Color(0xFF383843)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    canvas.drawCircle(Offset(0, size.height * 0.8), 4, dotPaint);
    canvas.drawCircle(Offset(size.width, size.height * 0.8), 4, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _LoadingDotPainter extends CustomPainter {
  final double progress;
  
  _LoadingDotPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate position along the curve
    final t = progress;
    final x = size.width * t;
    final y = _quadraticBezierY(
      0, size.height * 0.8,
      size.width / 2, -size.height * 0.3,
      size.width, size.height * 0.8,
      t,
    );
    
    // Draw the moving dot
    final dotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(Offset(x, y), 4, dotPaint);
    
    // Draw the progress line
    final linePaint = Paint()
      ..color = const Color(0xFF7A88F2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    final path = Path();
    path.moveTo(0, size.height * 0.8);
    
    // Draw partial curve up to current progress
    for (double i = 0; i <= t; i += 0.01) {
      final px = size.width * i;
      final py = _quadraticBezierY(
        0, size.height * 0.8,
        size.width / 2, -size.height * 0.3,
        size.width, size.height * 0.8,
        i,
      );
      if (i == 0) {
        path.moveTo(px, py);
      } else {
        path.lineTo(px, py);
      }
    }
    
    canvas.drawPath(path, linePaint);
  }

  double _quadraticBezierY(
    double x0, double y0,
    double x1, double y1,
    double x2, double y2,
    double t,
  ) {
    return (1 - t) * (1 - t) * y0 + 2 * (1 - t) * t * y1 + t * t * y2;
  }

  @override
  bool shouldRepaint(covariant _LoadingDotPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
