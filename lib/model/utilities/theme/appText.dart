class AppTexts {
  // Common texts (don’t change across themes)
  static const String appName = 'Your App Name';

  // Theme-specific texts
  final String welcomeMessage;
  final String emailAddress;
  final String enterEmail;
  final String password;
  final String enterPassword;
  final String forgotPassword;
  final String resetIt;
  final String login;
  final String signInWith;
  final String welcomeMessageSubtitle;
  final String signUp;
  final String noAccount;

  const AppTexts({
    required this.welcomeMessage,
    required this.emailAddress,
    required this.enterEmail,
    required this.password,
    required this.enterPassword,
    required this.forgotPassword,
    required this.resetIt,
    required this.login,
    required this.signInWith,
    required this.signUp,
    required this.welcomeMessageSubtitle,
    required this.noAccount
  });

  // English Language
  static const AppTexts english = AppTexts(
    welcomeMessage: 'Welcome back!',
    welcomeMessageSubtitle:"Please sign in with email address and password to access your account",
    emailAddress: 'Email Address',
    enterEmail: 'Enter Email',
    password: 'Password',
    enterPassword: 'Enter Password',
    forgotPassword: 'Forgot password?',
    resetIt: 'Reset it',
    login: 'Login',
    signInWith: 'or sign in with',
    signUp: 'Sign up',
    noAccount:"Don’t have account?"
  );

  // Spanish Language (example)
  static const AppTexts spanish = AppTexts(
    welcomeMessage: '¡Bienvenido de nuevo!',
    welcomeMessageSubtitle: 'Por favor, inicie sesión con su dirección de correo electrónico y contraseña para acceder a su cuenta',
    emailAddress: 'Dirección de correo electrónico',
    enterEmail: 'Introduce el correo electrónico',
    password: 'Contraseña',
    enterPassword: 'Introduce la contraseña',
    forgotPassword: '¿Olvidaste tu contraseña?',
    resetIt: 'Restablecerla',
    login: 'Iniciar sesión',
    signInWith: 'o inicia sesión con',
    signUp: 'Regístrate',
    noAccount: '¿No tienes una cuenta?',
  );

  // Add more languages as needed
}