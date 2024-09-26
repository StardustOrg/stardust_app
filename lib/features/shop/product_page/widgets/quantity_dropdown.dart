import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';
import 'package:stardust_app_skeleton/utils/device/device_utility.dart';

class DropdownQuantitySelector extends StatefulWidget {
  const DropdownQuantitySelector({
    super.key,
    required this.quantities,
    required this.onQuantityChanged,
  });

  final List<int> quantities;
  final ValueChanged<int> onQuantityChanged;

  @override
  State<DropdownQuantitySelector> createState() =>
      _DropdownQuantitySelectorState();
}

class _DropdownQuantitySelectorState extends State<DropdownQuantitySelector> {
  late int selectedQuantity;

  @override
  void initState() {
    super.initState();
    selectedQuantity = widget.quantities[0]; // Default selected quantity
  }

  @override
  Widget build(BuildContext context) {
    List<int> quantities = widget.quantities;

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
            ),
          );
        }).toList(),
        dropdownColor: StarColors.bgLight,
        onChanged: (int? newValue) {
          setState(() {
            selectedQuantity = newValue!;
          });
          widget.onQuantityChanged(newValue!);
        },
        selectedItemBuilder: (BuildContext context) {
          return quantities.map<Widget>((int value) {
            return Text(
              'Quantidade: $value',
            );
          }).toList();
        },
      ),
    );
  }
}
