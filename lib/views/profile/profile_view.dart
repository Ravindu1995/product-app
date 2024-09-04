import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/controllers/auth_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final user = authController.user.value;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: user?.photoURL != null
                    ? NetworkImage(user!.photoURL!)
                    : const AssetImage('assets/images/default_avatar.png')
                        as ImageProvider,
              ),
              const SizedBox(height: 20),
              Text(
                user?.displayName ?? "No Name",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                user?.email ?? "No Email",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                user?.phoneNumber ?? "No Mobile Number",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  authController.signOut();
                },
                icon: const Icon(Icons.logout),
                label: const Text("Sign Out"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
