// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pcom_app/common/widgets/my_text.dart';
// import 'package:pcom_app/common/widgets/smooth_rectangle_border.dart';

// import '../../app/core/core.dart';


// class MyTextFormField extends StatefulWidget {
//   const MyTextFormField({
//     super.key,
//     this.suffixIcon,
//     required this.labletxt,
//     required this.hinttxt,
//     this.icon,
//     this.validator,
//     required this.controller,
//     this.obscureTxt = false,
//     this.readOnly = false,
//     this.keyboardType = TextInputType.text,
//     this.isDropdown = false,
//     this.dropDownValue,
//     this.dropdownItems,
//     this.onChanged,
//     this.lableFontWeight = FontWeight.w500,
//     this.textCapitalization = TextCapitalization.none,
//     this.onTap,
//   });

//   final Widget? suffixIcon;
//   final VoidCallback? onTap;
//   final TextCapitalization textCapitalization;
//   final String labletxt;
//   final String? dropDownValue;
//   final String hinttxt;
//   final FontWeight lableFontWeight;
//   final Widget? icon;
//   final TextInputType keyboardType;
//   final bool obscureTxt;
//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//   final bool isDropdown;
//   final bool readOnly;
//   final List<DropdownMenuItem<String>>? dropdownItems;
//   final void Function(String?)? onChanged;

//   @override
//   State<MyTextFormField> createState() => _MyTextFormFieldState();
// }

// class _MyTextFormFieldState extends State<MyTextFormField> {
//   // var _passwordVisible = false;

//   @override
//   void initState() {
//     super.initState();
//     // _passwordVisible = false;
//     // _selectedValue = widget.dropDownValue ?? widget.dropdownItems?[0].value;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         MyText(
//           text: widget.labletxt,
//           fontSize: 16,
//           fontWeight: widget.lableFontWeight,
//           letterSpacing: 0.36,
//         ),
//         Container(
//           margin: const EdgeInsets.only(top: AppConfig.defaultPadding / 2),
//           decoration: const ShapeDecoration(
//             color: editTextFillColor,
//             shape: SmoothRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(8)),
//               smoothness: 1,
//             ),
//           ),
//           child: widget.isDropdown
//               ? DropdownButtonFormField<String>(
//                   borderRadius: BorderRadius.circular(8),
//                   style: const TextStyle(
//                     color: hinttextColor,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     letterSpacing: 0.32,
//                   ),
//                   // value: _selectedValue,
//                   value: widget.dropDownValue,
//                   decoration: const InputDecoration(
//                     isDense: true,
//                     contentPadding: EdgeInsets.all(AppConfig.defaultPadding / 1.5),
//                     border: InputBorder.none,
//                   ),
//                   items: widget.dropdownItems,
//                   onChanged: (String? newValue) {
//                     // setState(() {
//                     //   _selectedValue = newValue;
//                     // });
//                     // if (widget.onChanged != null) {
//                     widget.onChanged!(newValue);
//                     // }
//                   },
//                   iconSize: 30.0,
//                   icon: SvgPicture.asset(
//                     ic_box_arrow_down,
//                     width: 28.0,
//                     height: 28.0,
//                   ),
//                 )
//               : TextFormField(
//                   readOnly: widget.readOnly,
//                   onTap: widget.onTap,
//                   obscureText: widget.obscureTxt,
//                   validator: widget.validator,
//                   controller: widget.controller,
//                   keyboardType: widget.keyboardType,
//                   cursorColor: primaryColor,
//                   textCapitalization: widget.textCapitalization,
//                   maxLines: 1,
//                   decoration: InputDecoration(
//                     isDense: true,
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: AppConfig.defaultPadding,
//                       vertical: 12,
//                     ),
//                     hintText: widget.hinttxt,
//                     hintStyle: GoogleFonts.urbanist().copyWith(
//                       color: hinttextColor,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       letterSpacing: 0.32,
//                     ),
//                     suffixIcon: widget.suffixIcon,
//                     border: InputBorder.none,
//                   ),
//                 ),
//         ),
//       ],
//     );
//   }
// }
