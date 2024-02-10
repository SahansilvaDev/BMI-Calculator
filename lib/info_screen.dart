///imports material and GetX packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Import Routes file that where been set routes
import 'app_routes.dart';

///import where is the calculation goes in Bmi formula
import 'bmi_controller.dart';

///Information Screen
class InfoScreen extends StatelessWidget {
  final BMIController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final bmi = controller.bmi.value;
    String category = '';

    if (bmi < 16) {
      category = 'Severe undernourishment';
    } else if (bmi <= 16.9) {
      category = 'Medium undernourishment';
    } else if (bmi <= 18.4) {
      category = 'Slight undernourishment';
    } else if (bmi <= 24.9) {
      category = 'Normal nutrition state';
    } else if (bmi <= 29.9) {
      category = 'Overweight';
    } else if (bmi <= 39.9) {
      category = 'Obesity';
    } else {
      category = 'Pathological obesity';
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.yellow,
          titleTextStyle: TextStyle(fontSize: 18.0, color: Colors.black),
          title: Text('BMI Calculator - Information Screen')),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 30.0),
            Text(
              'Your BMI: ${bmi.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'Category: $category',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 40.0),
            Text(
              'Description',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.yellow, // Background color
                borderRadius: BorderRadius.circular(10), // rounded corners
              ),
              padding: EdgeInsets.all(10), // Add padding
              child: _getCategoryDescription(category),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('Back'),
            ),
          ],
        ),
      ),

      ///bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        currentIndex: 1, // Initially selected tab
        onTap: (index) {
          // Handle tab selection
          if (index == 0) {
            Get.offNamed(AppRoutes.home);
          } else if (index == 1) {
            Get.offNamed(AppRoutes.info);
          }
        },
      ),
    );
  }

  ///private method and return provined category description
  Widget _getCategoryDescription(String category) {
    switch (category) {
      case 'Severe undernourishment':
      case 'Medium undernourishment':
      case 'Slight undernourishment':
        return Text(
          'You are underweight. It is recommended to consult a healthcare professional for guidance on healthy weight gain.',
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        );
      case 'Normal nutrition state':
        return Text(
          'You are within a healthy weight range. Keep up the good work!',
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        );
      case 'Overweight':
      case 'Obesity':
      case 'Pathological obesity':
        return Text(
          'You are overweight or obese. It is recommended to consult a healthcare professional for guidance on healthy weight management.',
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        );
      default:
        return Text(
          'An error occurred. Please try again.',
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        );
    }
  }
}
