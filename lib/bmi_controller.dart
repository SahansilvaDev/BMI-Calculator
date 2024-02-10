import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMIController extends GetxController {
  // Text editing controllers for user input
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  // Variable to store calculated BMI using observable double value
  final RxDouble bmi = RxDouble(0.0);

  void calculateBMI() {
    try {
      // Check if height and weight controllers are empty
      if (heightController.text.isEmpty || weightController.text.isEmpty) {
        throw Exception("Please enter both height and weight.");
      }

      double height = double.parse(heightController.text) / 100;
      double weight = double.parse(weightController.text);

      // Check if height and weight are greater than zero
      if (height <= 0 || weight <= 0) {
        throw Exception("Height and weight must be greater than zero.");
      }

      bmi.value = weight / (height * height);
    } catch (e) {
      // Show error message using Snackbar
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP, // Position of the Snackbar
        backgroundColor: Colors.black, // Background color of the Snackbar
        colorText: Colors.white, // Text color of the Snackbar
      );
    }
  }
}
