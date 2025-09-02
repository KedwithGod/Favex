import 'package:favex/model/utilities/imports/shared.dart';


// Method 1: Using AnimatedContainer (Easiest)
class SimpleAnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;
  final double width;
  final double height;

  const SimpleAnimatedButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.color,
    this.width = 50,
    this.height = 44,
  }) : super(key: key);

  @override
  State<SimpleAnimatedButton> createState() => _SimpleAnimatedButtonState();
}

class _SimpleAnimatedButtonState extends State<SimpleAnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        width: widget.width,
        height: widget.height,
        // Scale down when pressed
        transform: Matrix4.identity()..scale(_isPressed ? 0.95 : 1.0),
        decoration: BoxDecoration(
          color: widget.color ?? colorsBucket!.transparent,
          borderRadius: BorderRadius.circular(12),
          // Add shadow that reduces when pressed
          boxShadow: [
            BoxShadow(
              color: colorsBucket!.white.withOpacity(_isPressed ? 0.1 : 0.2),
              offset: Offset(0, _isPressed ? 2 : 4),
              blurRadius: _isPressed ? 4 : 8,
            ),
          ],
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}

// Method 2: Using AnimatedScale (Flutter 3.0+)
class ScaleAnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;

  const ScaleAnimatedButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  State<ScaleAnimatedButton> createState() => _ScaleAnimatedButtonState();
}

class _ScaleAnimatedButtonState extends State<ScaleAnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 100),
        scale: _isPressed ? 0.9 : 1.0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: widget.color ?? Colors.green,
            borderRadius: BorderRadius.circular(8),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

// Method 3: Color Change Animation
class ColorAnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? normalColor;
  final Color? pressedColor;

  const ColorAnimatedButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.normalColor,
    this.pressedColor,
  }) : super(key: key);

  @override
  State<ColorAnimatedButton> createState() => _ColorAnimatedButtonState();
}

class _ColorAnimatedButtonState extends State<ColorAnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: _isPressed 
              ? (widget.pressedColor ?? Colors.red.shade700)
              : (widget.normalColor ?? Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        child: widget.child,
      ),
    );
  }
}

// Method 4: Bounce Animation
class BounceAnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;

  const BounceAnimatedButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  State<BounceAnimatedButton> createState() => _BounceAnimatedButtonState();
}

class _BounceAnimatedButtonState extends State<BounceAnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    _controller.forward().then((_) {
      _controller.reverse();
      if (widget.onPressed != null) {
        widget.onPressed!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              decoration: BoxDecoration(
                color: widget.color ?? Colors.purple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}

// Method 5: Ultra Simple with TweenAnimationBuilder
class TweenAnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;

  const TweenAnimatedButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  State<TweenAnimatedButton> createState() => _TweenAnimatedButtonState();
}

class _TweenAnimatedButtonState extends State<TweenAnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 100),
        tween: Tween(begin: 1.0, end: _isPressed ? 0.85 : 1.0),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: widget.color ?? Colors.orange,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, scale * 4),
                    blurRadius: scale * 8,
                  ),
                ],
              ),
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}

// Example Usage Page
class AnimatedButtonsExample extends StatelessWidget {
  const AnimatedButtonsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Pressed Containers'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Method 1: Scale + Shadow
              SimpleAnimatedButton(
                onPressed: () => print('Simple button pressed!'),
                child: const Text(
                  'Scale + Shadow',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              
              // Method 2: Scale only
              ScaleAnimatedButton(
                onPressed: () => print('Scale button pressed!'),
                child: const Text(
                  'Scale Animation',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              
              // Method 3: Color change
              ColorAnimatedButton(
                onPressed: () => print('Color button pressed!'),
                child: const Text(
                  'Color Change',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              
              // Method 4: Bounce
              BounceAnimatedButton(
                onPressed: () => print('Bounce button pressed!'),
                child: const Text(
                  'Bounce Effect',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              
              // Method 5: Tween
              TweenAnimatedButton(
                onPressed: () => print('Tween button pressed!'),
                child: const Text(
                  'Tween Animation',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
