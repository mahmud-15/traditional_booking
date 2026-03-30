import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';
import '../../../core/widgets/custom_appbar.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Settings"),
      body: ListView(
        children: [
          _buildSettingsSection("Preferences"),
          _buildSettingsTile(Icons.language, "Language", "English"),
          _buildSettingsTile(
            Icons.notifications_active_outlined,
            "Push Notifications",
            "On",
          ),
          _buildSettingsSection("Security"),
          _buildSettingsTile(Icons.lock_outline, "Change Password", ""),
          _buildSettingsTile(
            Icons.fingerprint,
            "Biometric Authentication",
            "Off",
          ),
          _buildSettingsSection("Support"),
          _buildSettingsTile(
            Icons.description_outlined,
            "Terms & Conditions",
            "",
          ),
          _buildSettingsTile(Icons.privacy_tip_outlined, "Privacy Policy", ""),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: const TextStyle(color: Colors.grey)),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
      onTap: () {},
    );
  }
}
