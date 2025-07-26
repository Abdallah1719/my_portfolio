// contact_card.dart
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              'تواصل معي',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 24),
            
            // Contact Icons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ContactIconButton(
                  icon: Icons.email,
                  label: 'البريد الإلكتروني',
                  color: Colors.red,
                  onPressed: () {
                    // Email functionality
                  },
                ),
                ContactIconButton(
                  icon: Icons.phone,
                  label: 'الهاتف',
                  color: Colors.green,
                  onPressed: () {
                    // Phone functionality
                  },
                ),
                ContactIconButton(
                  icon: Icons.link,
                  label: 'موقع الويب',
                  color: Colors.blue,
                  onPressed: () {
                    // Website functionality
                  },
                ),
                ContactIconButton(
                  icon: Icons.facebook,
                  label: 'فيسبوك',
                  color: Colors.indigo,
                  onPressed: () {
                    // Facebook functionality
                  },
                ),
                ContactIconButton(
                  icon: Icons.work,
                  label: 'لينكد إن',
                  color: Colors.blueAccent,
                  onPressed: () {
                    // LinkedIn functionality
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContactIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const ContactIconButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon, color: color),
            tooltip: label,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}