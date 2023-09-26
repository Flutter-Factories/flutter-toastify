import 'package:flutter/material.dart';
import 'package:flutter_toastify/_toast_manager.dart';
import 'package:flutter_toastify/_toast_widget.dart';

class ToastOverlay extends StatefulWidget {
  const ToastOverlay({super.key, required this.child});

  final Widget child;

  @override
  State<ToastOverlay> createState() => _ToastOverlayState();
}

class _ToastOverlayState extends State<ToastOverlay> {
  final ToastManager _toastManager = ToastManager.instance;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          widget.child,
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: 320,
              child: ValueListenableBuilder(
                valueListenable: _toastManager.controllers,
                builder: (_, it, __) {
                  return ListView.builder(
                    key: _listKey,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 16, right: 8),
                    itemCount: it.length,
                    itemBuilder: (_, index) {
                      final item = _toastManager.controllers.value[index];

                      return ToastWidget(key: item.key, controller: item);
                    },
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
