import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/message_controller.dart';
import '../../../core/widgets/custom_appbar.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Messages", showBackButton: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.message_outlined, size: 80, color: Colors.grey[300]),
            const SizedBox(height: 16),
            const Text("No messages yet", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
