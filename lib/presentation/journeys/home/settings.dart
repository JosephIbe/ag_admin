import 'package:flutter/material.dart';

import 'package:agoris_admin/common/size_constants.dart';

import 'package:agoris_admin/presentation/theme/colors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  int selectedIndex = 0; // 0 for Profile, 1 for Password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(Sizes.dimen_16),
            child: Row(
              children: [
                toggleButton("Profile", 0),
                const SizedBox(width: Sizes.dimen_8),

                toggleButton("Password", 1),
              ],
            ),
          ),
          Expanded(
            child: selectedIndex == 0 ? ProfileView() : PasswordView(),
          ),
        ],
      ),
    );
  }

  Widget toggleButton(String title, int index) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedIndex == index ? Colors.green : Colors.white,
        foregroundColor: selectedIndex == index ? Colors.white : Colors.black,
        side: const BorderSide(color: Colors.green),
      ),
      onPressed: () => setState(() => selectedIndex = index),
      child: Text(title),
    );
  }
}

class ProfileView extends StatelessWidget {

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.dimen_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Personal Info", style: TextStyle(fontSize: Sizes.dimen_20, fontWeight: FontWeight.bold)),
          const SizedBox(height: Sizes.dimen_8),

          const Text("Update your photo and personal details here."),
          const SizedBox(height: Sizes.dimen_16),

          buildTextField("Name", "John Doe"),
          buildTextField("Email Address", "admin@agoris.com", icon: Icons.email),
          buildTextField("Role", "Administrator"),
          const SizedBox(height: Sizes.dimen_16),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(onPressed: () {}, child: const Text("Cancel")),
              const SizedBox(width: Sizes.dimen_8),
              ElevatedButton(onPressed: () {}, child: const Text("Save")),
            ],
          )
        ],
      ),
    );
  }
}

class PasswordView extends StatelessWidget {

  const PasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.dimen_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Password", style: TextStyle(fontSize: Sizes.dimen_20, fontWeight: FontWeight.bold)),
          const SizedBox(height: Sizes.dimen_8),

          const Text("Please enter your current password to change it."),
          const SizedBox(height: Sizes.dimen_16),

          buildTextField("Current Password", "********", obscureText: true),
          buildTextField("New Password", "********", obscureText: true),
          buildTextField("Confirm New Password", "********", obscureText: true),
          const SizedBox(height: Sizes.dimen_16),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(onPressed: () {}, child: const Text("Cancel")),
              const SizedBox(width: Sizes.dimen_8),
              ElevatedButton(onPressed: () {}, child: const Text("Update Password")),
            ],
          ),
          const SizedBox(height: Sizes.dimen_16),

          const Divider(),

        ],
      ),
    );
  }
}

Widget buildTextField(String label, String placeholder, {bool obscureText = false, IconData? icon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon != null ? Icon(icon) : null,
        border: OutlineInputBorder(),
      ),
    ),
  );
}

Widget buildLoggedInDevice(String device, String location, String status) {
  return ListTile(
    leading: Icon(Icons.computer),
    title: Text(device),
    subtitle: Text(location),
    trailing: Chip(
      label: Text(status, style: TextStyle(color: Colors.white)),
      backgroundColor: status == "Active now" ? Colors.green : Colors.grey,
    ),
  );
}