import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {}

class RecentMessageView extends GetView<MessageController> {
  const RecentMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Messages Coming Soon"));
  }
}
