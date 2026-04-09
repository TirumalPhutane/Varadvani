import 'package:flutter/material.dart';
import 'package:varadvani/data/timeline_item.dart';
import 'package:varadvani/theme/color_code.dart';

class FlippableCard extends StatefulWidget {
  final TimelineItem item;
  final bool isRight;

  const FlippableCard({super.key, required this.item, required this.isRight});

  @override
  State<FlippableCard> createState() => _FlippableCardState();
}

class _FlippableCardState extends State<FlippableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFlipped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    if (_isFlipped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() => _isFlipped = !_isFlipped);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          // Front shows when angle < 90°, back shows when angle >= 90°
          final isShowingFront = _animation.value < 0.5;

          // Flip angle: 0 → pi (180°)
          final angle = _animation.value * 3.14159;

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // perspective
              ..rotateY(angle),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Shadow card
                if (isShowingFront)
                  Positioned(
                    top: 7,
                    left: widget.isRight ? 6 : -6,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..rotateY(isShowingFront ? 0 : 3.14159),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(
                            ColorCode.orange,
                          ).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: _cardContent(context, isShowingFront),
                      ),
                    ),
                  ),
                // Main card
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateY(isShowingFront ? 0 : 3.14159),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isShowingFront
                          ? Colors.white
                          : Color(ColorCode.orange).withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: _cardContent(context, isShowingFront),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _cardContent(BuildContext context, bool isFront) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isFront)
          Text(
            '${widget.item.year}${widget.item.date != null ? ', (${widget.item.date})' : ''}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Mukta',
              color: Color(ColorCode.black),
              letterSpacing: 0,
              height: 1.5,
            ),
          ),
        if (isFront)
          Text(
            widget.item.age,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Mukta',
              color: Color(ColorCode.black),
              letterSpacing: 0,
              height: 1.5,
            ),
          ),
        // Show different content on back if needed
        Text(
          isFront ? widget.item.description : widget.item.backContent,
          overflow: TextOverflow.ellipsis,
          maxLines: isFront ? 1 : 10,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Mukta',
            color: Color(ColorCode.black),
            letterSpacing: 0,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
