///imports material and GetX packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Import Routes file that where been set routes
import 'app_routes.dart';

///import where is the calculation goes in Bmi formula
import 'bmi_controller.dart';

///Home Screen
class HomeScreen extends StatelessWidget {
  final BMIController controller = Get.put(BMIController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.yellow,
          titleTextStyle: TextStyle(fontSize: 25.0, color: Colors.black),
          title: Text('BMI Calculator')),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 10.0),
            TextField(
              controller: controller.weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Weight (kg)',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.yellow))),
            ),
            SizedBox(height: 30.0),
            TextField(
              controller: controller.heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Height (cm)',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.white))),
            ),
            SizedBox(height: 20.0),

            ///Calculate Button
            ElevatedButton(
              onPressed: () => controller.calculateBMI(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 40,
                ), // Add padding
                child: Text(
                  'Calculate',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white), // button font size and text colr
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10)), // button border radius
                backgroundColor: Colors.black, // button color
              ),
            ),
            SizedBox(height: 20.0),

            ///Reset Button
            ElevatedButton(
              onPressed: () {
                // Reset the input fields and BMI value
                controller.heightController.clear();
                controller.weightController.clear();
                controller.bmi.value = 0.0;
              },
              child: Text('Reset'),
            ),
            SizedBox(height: 40),

            ///Bmi value updated when bmi controller change
            Obx(
              () => Container(
                decoration: BoxDecoration(
                  color: Colors.yellow, // Background color
                  borderRadius:
                      BorderRadius.circular(10), // rounded corners add
                ),
                padding: EdgeInsets.all(10), // padding added
                child: Text(
                  'BMI: ${controller.bmi.value.toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 40.0, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),

      ///Bottom navigation bar
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
        currentIndex: 0, // selected tab
        onTap: (index) {
          // Handle tab selection
          if (index == 0) {
            Get.offNamed(AppRoutes.home);
          } else if (index == 1) {
            Get.toNamed(AppRoutes.info);
          }
        },
      ),
    );
  }
}
