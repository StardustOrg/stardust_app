import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';

class DropdownQuantitySelector extends StatefulWidget {
  const DropdownQuantitySelector({super.key, required this.quantities});

  final List<int> quantities;

  @override
  State<DropdownQuantitySelector> createState() =>
      _DropdownQuantitySelectorState();
}

class _DropdownQuantitySelectorState extends State<DropdownQuantitySelector> {
  @override
  Widget build(BuildContext context) {
    List<int> quantities = widget.quantities;
    int selectedQuantity = quantities[0]; // Default selected quantity
    return SizedBox(
      width: StarDeviceUtils.getScreenWidth(context) * 0.45,
      child: DropdownButtonFormField(
        value: selectedQuantity,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: StarColors.grey,
        ),
        iconSize: 20,
        elevation: 1,
        borderRadius: BorderRadius.circular(2),
        style: const TextStyle(
          fontSize: StarSizes.fontSizeSm,
          color: StarColors.textSecondary,
        ),
        items: quantities.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(
              value.toString(),
            ), // Display the value in the dropdown
          );
        }).toList(),
        dropdownColor: StarColors.bgLight,
        onChanged: (int? newValue) {
          setState(() {
            selectedQuantity = newValue!; // Update the selected quantity
          });
        },
        selectedItemBuilder: (BuildContext context) {
          return quantities.map<Widget>((int value) {
            return Text(
              'Quantidade: $value',
            ); // Format the selected item display
          }).toList();
        },
      ),
    );
  }
}
