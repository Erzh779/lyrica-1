// import 'package:control/control.dart';
// import 'package:flutter/material.dart';
// import 'package:poem/src/features/auth/controller/auth_controller.dart';
// import 'package:poem/src/features/auth/widget/auth_scope.dart';

// /// {@template email_confirmation_form}
// /// EmailConfirmationForm widget.
// /// {@endtemplate}
// class EmailConfirmationForm extends StatefulWidget {
//   /// {@macro email_confirmation_form}
//   const EmailConfirmationForm({
//     super.key, // ignore: unused_element
//   });

//   @override
//   State<EmailConfirmationForm> createState() => _EmailConfirmationFormState();
// }

// /// State for widget EmailConfirmationForm.
// class _EmailConfirmationFormState extends State<EmailConfirmationForm>
//     with _EmailConfirmationFormStateMixin {
//   @override
//   Widget build(BuildContext context) =>
//       StateConsumer<AuthController, AuthState>(
//         controller: _controller,
//         builder: (context, state, child) => Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           spacing: 16,
//           children: [
//             Text(
//               'Please enter the code sent to ${state.user.email}',
//             ),
//             TextField(
//               enabled: !state.isProcessing,
//               controller: _codeController,
//               maxLength: 6,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: 'Code',
//               ),
//             ),
//             ElevatedButton(
//               onPressed: state.isProcessing ? null : _onSubmit,
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       );
// }

// mixin _EmailConfirmationFormStateMixin on State<EmailConfirmationForm> {
//   late final AuthController _controller;

//   final _codeController = TextEditingController();

//   @override
//   void initState() {
//     _controller = AuthScope.of(
//       context,
//       false,
//     );

//     super.initState();
//   }

//   void _onSubmit() {
//     final code = _codeController.text;
//     if (code.isEmpty) return;

//     // submit code
//     _controller.confirmEmail(
//       token: code,
//     );
//   }

//   @override
//   void dispose() {
//     _codeController.dispose();

//     super.dispose();
//   }
// }
