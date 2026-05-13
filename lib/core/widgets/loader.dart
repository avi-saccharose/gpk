import 'package:flutter/material.dart';

// AI Generated
class ElasticWaveLoader extends StatefulWidget {
  const ElasticWaveLoader({super.key});

  @override
  State<ElasticWaveLoader> createState() => _ElasticWaveLoaderState();
}

class _ElasticWaveLoaderState extends State<ElasticWaveLoader>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(3, (i) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1200),
      )..repeat(reverse: true, period: Duration(milliseconds: 1200 + i * 150));
    });
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(3, (i) {
          return AnimatedBuilder(
            animation: _controllers[i],
            builder: (context, child) {
              final value = _controllers[i].value;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 10,
                height: 10 + (value * 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      Color.lerp(
                        const Color(0xFF667EEA),
                        const Color(0xFF764BA2),
                        i / 2.0,
                      )!,
                      Color.lerp(
                        const Color(0xFF667EEA),
                        const Color(0xFFF093FB),
                        i / 2.0,
                      )!,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(
                        0xFF667EEA,
                      ).withValues(alpha: 0.4 * value),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
