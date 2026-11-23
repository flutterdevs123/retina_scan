/// All user-facing static texts live here (easy to edit / localize later).
class AppStrings {
  AppStrings._();

  // ---------------------------------------------------------------------------
  // General
  // ---------------------------------------------------------------------------
  static const String appName = 'Retina Scan';

  // ---------------------------------------------------------------------------
  // Roles
  // ---------------------------------------------------------------------------
  static const String roleDoctor = 'Doctor';
  static const String rolePatient = 'Patient';
  static const String roleLabel = 'I am a';

  // ---------------------------------------------------------------------------
  // Splash
  // ---------------------------------------------------------------------------
  static const String splashTagline =
      'Smart retina screening,\nright at your fingertips';
  static const String splashLoading = 'Preparing your secure scan...';

  // ---------------------------------------------------------------------------
  // Common buttons
  // ---------------------------------------------------------------------------
  static const String skip = 'Skip';
  static const String next = 'Next';
  static const String getStarted = 'Get Started';

  // ---------------------------------------------------------------------------
  // Onboarding
  // ---------------------------------------------------------------------------
  static const String onboardingTitle1 = 'Scan Your Retina\nIn Seconds';
  static const String onboardingDesc1 =
      'Use your phone camera to capture a clear retina image quickly and '
      'easily, with simple on-screen guidance.';

  static const String onboardingTitle2 = 'Smart Analysis\nYou Can Trust';
  static const String onboardingDesc2 =
      'Advanced analysis highlights early signs of eye conditions and '
      'gives you clear, easy to understand results.';

  static const String onboardingTitle3 = 'Private And\nSecure Records';
  static const String onboardingDesc3 =
      'Your scans are protected and stored safely. Track your eye health '
      'over time and share reports with your doctor.';

  // ---------------------------------------------------------------------------
  // Auth: shared field labels and hints
  // ---------------------------------------------------------------------------
  static const String emailLabel = 'Email';
  static const String emailHint = 'you@example.com';
  static const String passwordLabel = 'Password';
  static const String passwordHint = 'Enter your password';
  static const String newPasswordHint = 'Create a strong password';
  static const String fullNameLabel = 'Full Name';
  static const String fullNameHint = 'Enter your full name';
  static const String confirmPasswordLabel = 'Confirm Password';
  static const String confirmPasswordHint = 'Re-enter your password';

  // ---------------------------------------------------------------------------
  // Login
  // ---------------------------------------------------------------------------
  static const String loginTitle = 'Welcome Back';
  static const String loginSubtitle =
      'Log in to continue your eye health journey';
  static const String forgotPassword = 'Forgot Password?';
  static const String logIn = 'Log In';
  static const String noAccount = "Don't have an account?";
  static const String signUp = 'Sign Up';

  // ---------------------------------------------------------------------------
  // Sign up
  // ---------------------------------------------------------------------------
  static const String signupTitle = 'Create Account';
  static const String signupSubtitle =
      'Sign up to start scanning and tracking your eye health';
  static const String createAccount = 'Create Account';
  static const String haveAccount = 'Already have an account?';

  // ---------------------------------------------------------------------------
  // Verify email
  // ---------------------------------------------------------------------------
  static const String verifyTitle = 'Verify Your Email';
  static const String verifySubtitle =
      'We have sent a verification link to your inbox. Please open it to '
      'verify your email address.';
  static const String verifySpamTip =
      "Can't find the email in your inbox? Please check your spam or junk "
      'folder.';
  static const String resendEmail = 'Resend Email';
  static const String verifyResent = 'Verification email sent again';
  static const String alreadyVerified = 'Already verified?';

  /// Button label while the resend cooldown is running.
  static String resendIn(int seconds) => 'Resend in ${seconds}s';

  // ---------------------------------------------------------------------------
  // Forgot password
  // ---------------------------------------------------------------------------
  static const String forgotTitle = 'Forgot Password?';
  static const String forgotSubtitle =
      "Enter your email and we'll send you a link to reset your password.";
  static const String sendResetLink = 'Send Reset Link';
  static const String rememberPassword = 'Remember your password?';
  static const String resetSentTitle = 'Check Your Email';
  static const String resetSentDesc =
      'We have sent a password reset link to the email address below.';
  static const String resetResent = 'Reset link sent again';
  static const String backToLogin = 'Back to Log In';
  static const String resendLink = 'Resend Link';
  static const String useDifferentEmail = 'Use a different email';

  // ---------------------------------------------------------------------------
  // Dashboards (shared)
  // ---------------------------------------------------------------------------
  static const String welcomeBack = 'Welcome back,';
  static const String logOut = 'Log Out';
  static const String quickActions = 'Quick Actions';

  // ---------------------------------------------------------------------------
  // Doctor dashboard
  // ---------------------------------------------------------------------------
  static const String statPatientsToday = 'Patients Today';
  static const String statPendingReports = 'Pending Reports';
  static const String actionPatientList = 'Patient List';
  static const String actionPatientListDesc = 'View and manage your patients';
  static const String actionReviewScans = 'Review Scans';
  static const String actionReviewScansDesc = 'Check newly uploaded scans';

  // ---------------------------------------------------------------------------
  // Patient dashboard
  // ---------------------------------------------------------------------------
  static const String statTotalScans = 'Total Scans';
  static const String statLastResult = 'Last Result';
  static const String resultNormal = 'Normal';
  static const String actionStartScan = 'Start New Scan';
  static const String actionStartScanDesc = 'Capture your retina in seconds';
  static const String actionMyReports = 'My Reports';
  static const String actionMyReportsDesc = 'See your past scan results';
  static const String actionFindDoctor = 'Find a Doctor';
  static const String actionFindDoctorDesc = 'Share reports with a specialist';

  // ---------------------------------------------------------------------------
  // Validation errors
  // ---------------------------------------------------------------------------
  static const String errNameRequired = 'Please enter your full name';
  static const String errNameShort = 'Name must be at least 3 characters';
  static const String errEmailRequired = 'Please enter your email';
  static const String errEmailInvalid = 'Please enter a valid email address';
  static const String errPasswordRequired = 'Please enter your password';
  static const String errPasswordShort =
      'Password must be at least 8 characters';
  static const String errPasswordWeak =
      'Password must contain at least one letter and one number';
  static const String errConfirmRequired = 'Please confirm your password';
  static const String errPasswordMismatch = 'Passwords do not match';
  static const String errInvalidCredentials =
      'Incorrect email or password. Please try again.';
}