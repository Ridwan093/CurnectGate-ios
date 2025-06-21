import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class CustomStatusDropdown extends StatefulWidget {
  final Function(String) onStatusChanged;
  final String initialStatus;

  final List<String> statusOptions;



  const CustomStatusDropdown({
    super.key,
    required this.onStatusChanged,
    required this.statusOptions,
   required  this.initialStatus,
  });

  @override
  State<CustomStatusDropdown> createState() => _CustomStatusDropdownState();
}

class _CustomStatusDropdownState extends State<CustomStatusDropdown> {
  late String _selectedStatus;

  final GlobalKey _buttonKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.initialStatus;
  }

  void _showDropdownMenu() async {
    final RenderBox renderBox =
        _buttonKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + size.height,
        offset.dx + size.width,
        offset.dy,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color:
          Colors.white, // <-- Set background color of the whole menu to white
      items:
          widget.statusOptions.map((status) {
            return PopupMenuItem<String>(
              value: status,
              height: 32, // compact height
              padding: EdgeInsets.zero, // remove default padding
              child: Container(
                color: Colors.white, // white background per item
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  status,
                  style: const TextStyle(
                    fontSize: 11,
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
    );

    if (selected != null) {
      setState(() {
        _selectedStatus = selected;
        widget.onStatusChanged(selected);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _buttonKey,
      onTap: _showDropdownMenu,
      child: Container(
        height: 48, // You can adjust height here
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.instance.black500),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _selectedStatus,
              style: TextStyle(
                fontSize: 12,
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.arrow_drop_down,
              size: 20,
              color: AppColors.instance.black600,
            ),
          ],
        ),
      ),
    );
  }
}
