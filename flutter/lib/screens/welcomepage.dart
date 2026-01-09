import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Spacer(flex: 2),
              
              // Logo
              SvgPicture.asset(
                'assets/icons/Logo.svg',
                height: 60,
              ),
              
              const Spacer(flex: 2),
              
              // Buttons
              Column(
                children: [
                  // Register Button
                  GestureDetector(
                    onTap: () => context.go('/signup'),
                    child: Container(
                      width: double.infinity,
                      height: 58,
                      decoration: BoxDecoration(
                        color: const Color(0xFF7A88F2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "Register",
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
                  
                  const SizedBox(height: 16),
                  
                  // Sign In Button
                  GestureDetector(
                    onTap: () => context.go('/login'),
                    child: Container(
                      width: double.infinity,
                      height: 58,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF111111),
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 50),
              
              // Divider with "or"
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "or",
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: -0.15,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Social Sign Up Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Facebook
                  _SocialButton(
                    onTap: () {
                      // TODO: Implement Facebook login
                    },
                    child: const Icon(
                      Icons.facebook,
                      size: 32,
                      color: Color(0xFF1877F2),
                    ),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  // Google
                  _SocialButton(
                    onTap: () {
                      // TODO: Implement Google login
                    },
                    child: const Text(
                      "G",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFEA4335),
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  // Apple
                  _SocialButton(
                    onTap: () {
                      // TODO: Implement Apple login
                    },
                    child: const Icon(
                      Icons.apple,
                      size: 32,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.onTap,
    required this.child,
  });

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: child),
      ),
    );
  }
}
