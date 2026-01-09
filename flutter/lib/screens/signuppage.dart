import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  int _currentStep = 0; // 0 = email, 1 = email verification, 2 = password
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreedToTerms = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignup() {
    // TODO: Implement signup logic
    // For now, navigate to home
    context.go('/home');
  }

  void _nextStep() {
    if (_currentStep == 0) {
      // Validate email before proceeding
      if (_emailController.text.isNotEmpty) {
        setState(() {
          _currentStep = 1;
        });
      }
    } else if (_currentStep == 1) {
      // Move to password step
      setState(() {
        _currentStep = 2;
      });
    } else {
      _handleSignup();
    }
  }

  void _resendEmail() {
    // TODO: Implement resend email logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Activation link resent to ${_emailController.text}',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: const Color(0xFF7A88F2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      body: SafeArea(
        child: Column(
          children: [
            // Progress slider
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: const Color(0xFF7A88F2),
                        borderRadius: BorderRadius.circular(1.5),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: _currentStep >= 1
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
                        color: _currentStep >= 2
                            ? const Color(0xFF7A88F2)
                            : const Color(0xFFC5C2D2),
                        borderRadius: BorderRadius.circular(1.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Header with back button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (_currentStep > 0) {
                        setState(() {
                          _currentStep--;
                        });
                      } else {
                        context.go('/');
                      }
                    },
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 24), // Placeholder for alignment
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _currentStep == 0 
                    ? _buildEmailStep() 
                    : _currentStep == 1 
                        ? _buildEmailVerificationStep() 
                        : _buildPasswordStep(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailStep() {
    return Column(
      children: [
        const SizedBox(height: 40),
        
        // Title
        Text(
          'Please provide your email address',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            height: 1.3,
            letterSpacing: -0.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        
        // Subtitle
        Text(
          'We need this information to verify your identity',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFC5C2D2),
            height: 1.625,
            letterSpacing: -0.5,
          ),
          textAlign: TextAlign.center,
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
              hintText: 'Please type your email',
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
        const SizedBox(height: 32),

        // Sign In button
        GestureDetector(
          onTap: _nextStep,
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
          label: 'Register with google',
          backgroundColor: const Color(0xFF343552),
          onTap: () {
            // TODO: Google sign-in
          },
        ),
        const SizedBox(height: 16),

        // Apple button
        _buildSocialButton(
          icon: Icons.apple,
          label: 'Register with apple',
          backgroundColor: const Color(0xFF333333),
          onTap: () {
            // TODO: Apple sign-in
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildEmailVerificationStep() {
    return Column(
      children: [
        const SizedBox(height: 40),
        
        // Title
        Text(
          'Please check your email for the account configuration link',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            height: 1.3,
            letterSpacing: -0.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        
        // Subtitle
        Text(
          'An account activation link has been sent to your email address',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFC5C2D2),
            height: 1.625,
            letterSpacing: -0.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),

        // Open Email button
        GestureDetector(
          onTap: _nextStep,
          child: Container(
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFF7A88F2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Open Email',
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
        const SizedBox(height: 48),

        // Haven't received text
        Text(
          "Haven't received the configuration link?",
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF727272),
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),

        // Resend it link
        GestureDetector(
          onTap: _resendEmail,
          child: Text(
            'Resend it',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF7A88F2),
              height: 1.625,
              letterSpacing: -0.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildPasswordStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        
        // Title
        Text(
          "It's a pleasure to meet you!",
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
          'Sign up and get started',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFC5C2D2),
            height: 1.625,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 48),

        // Email field (read-only, showing the email entered)
        Container(
          height: 58,
          decoration: BoxDecoration(
            color: const Color(0xFF383843),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF383843), width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _emailController.text.isEmpty ? 'Email' : _emailController.text,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: _emailController.text.isEmpty 
                      ? const Color(0xFFC5C2D2) 
                      : Colors.white,
                ),
              ),
            ),
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
              hintText: 'Please enter your password',
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
        const SizedBox(height: 16),

        // Confirm password field
        Container(
          height: 58,
          decoration: BoxDecoration(
            color: const Color(0xFF383843),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF383843), width: 2),
          ),
          child: TextField(
            controller: _confirmPasswordController,
            obscureText: _obscureConfirmPassword,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: 'Confirmation password',
              hintStyle: GoogleFonts.poppins(
                fontSize: 16,
                color: const Color(0xFFC5C2D2),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
                child: Icon(
                  _obscureConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: const Color(0xFFC5C2D2),
                  size: 24,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 48),

        // Sign In button
        GestureDetector(
          onTap: _agreedToTerms ? _handleSignup : null,
          child: Container(
            height: 58,
            decoration: BoxDecoration(
              color: _agreedToTerms 
                  ? const Color(0xFF7A88F2) 
                  : const Color(0xFF7A88F2).withOpacity(0.5),
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

        // Terms and conditions checkbox
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _agreedToTerms = !_agreedToTerms;
                });
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: _agreedToTerms 
                      ? const Color(0xFF7A88F2) 
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: _agreedToTerms 
                        ? const Color(0xFF7A88F2) 
                        : const Color(0xFFC5C2D2),
                    width: 2,
                  ),
                ),
                child: _agreedToTerms
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(text: 'By clicking "Agree," you accept the '),
                    TextSpan(
                      text: 'terms',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: const Color(0xFF7A88F2),
                      ),
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'conditions',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: const Color(0xFF7A88F2),
                      ),
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
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
