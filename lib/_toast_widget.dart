import 'package:flutter/material.dart';
import 'package:flutter_toastify/_decorated_sizedbox.dart';
import 'package:flutter_toastify/_toast_manager.dart';

class ToastWidget extends StatelessWidget {
  const ToastWidget({
    super.key,
    this.showProgress = true,
    required this.controller,
  });

  final bool showProgress;
  final ToastController controller;

  @override
  Widget build(BuildContext context) {
    return DecoratedSizedBox(
      key: key,
      height: 80,
      width: 320,
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(4),
          bottom: Radius.circular(4),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              visualDensity: VisualDensity.compact,
              iconSize: 18,
              onPressed: controller.dismiss,
              color: Colors.grey,
              icon: const Icon(Icons.close),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('🦄 Wow so easy ! ${key.toString()}'),
            ),
          ),
          if (showProgress)
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 6,
                width: double.infinity,
                // TODO: (Phil) implement custom linearProgressIndicator for perf
                child: ValueListenableBuilder(
                  valueListenable: controller.remainingTime,
                  builder: (_, it, __) {
                    final computed =
                        it.inMicroseconds / controller.duration.inMicroseconds;
                    return LinearProgressIndicator(
                      value: computed,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.green,
                      ),
                      backgroundColor: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
