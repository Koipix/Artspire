import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    // TODO: Implement login logic
    // For now, navigate to home
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.go('/'),
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    
                    // Title
                    Text(
                      "It's great to have you back!",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: 1.33,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // Subtitle
                    Text(
                      'Sign in and continue your art journey',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFC5C2D2),
                        height: 1.625,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 48),

                    // Email field
                    Container(
                      height: 58,
                      decoration: BoxDecoration(
                        color: const Color(0xFF383843),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF383843), width: 2),
                      ),
                      child: TextField(
                        controller: _emailController,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color(0xFFC5C2D2),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Password field
                    Container(
                      height: 58,
                      decoration: BoxDecoration(
                        color: const Color(0xFF383843),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF383843), width: 2),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color(0xFFC5C2D2),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            child: Icon(
                              _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              color: const Color(0xFFC5C2D2),
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Sign In button
                    GestureDetector(
                      onTap: _handleLogin,
                      child: Container(
                        height: 58,
                        decoration: BoxDecoration(
                          color: const Color(0xFF7A88F2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Sign In',
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

                    // Forgot password
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // TODO: Implement forgot password
                        },
                        child: Text(
                          'Forgot password?',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF7A88F2),
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),

                    // Divider with "or"
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: const Color(0xFF383843),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'or',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xFFC5C2D2),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: const Color(0xFF383843),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    // Google button
                    _buildSocialButton(
                      icon: Icons.g_mobiledata,
                      label: 'Sign in with google',
                      backgroundColor: const Color(0xFF343552),
                      onTap: () {
                        // TODO: Google sign-in
                      },
                    ),
                    const SizedBox(height: 16),

                    // Apple button
                    _buildSocialButton(
                      icon: Icons.apple,
                      label: 'Sign in with apple',
                      backgroundColor: const Color(0xFF333333),
                      onTap: () {
                        // TODO: Apple sign-in
                      },
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: backgroundColor == const Color(0xFF343552) 
                ? const Color(0xFF343552) 
                : Colors.transparent,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: GoogleFonts.roboto(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: -0.17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
