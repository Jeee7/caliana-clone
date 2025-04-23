import 'package:caliana_clone/components/bottom_sheet_confirmation.dart';
import 'package:caliana_clone/form/confirmation_data_screen.dart';
import 'package:caliana_clone/utility/divider.dart';
import 'package:caliana_clone/utility/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _idCardController = TextEditingController();
  final TextEditingController _accessCardController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool isFormValid() {
    return _nameController.text.isNotEmpty && _emailController.text.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  Future<bool> _onWillPop(BuildContext context) async {
    final bool? result = await CancelConfirmationBottomSheet.show(context);
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              'Formulir Registrasi',
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Center(
                  child: Text(
                    "1",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                gapHeight(12),
                const Center(
                  child: Text(
                    "Data Pribadi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                gapHeight(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Nomor Kartu Identitas",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        gapWidth(4),
                        Text(
                          "(tidak wajib diisi)",
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    gapHeight(8),
                    TextFormField(
                      controller: _idCardController,
                      style: const TextStyle(
                        color: Colors.lightBlue,
                      ),
                      decoration: InputDecoration(
                        hintText: "Masukkan Nomor Kartu Identitas",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 12,
                        ),
                        prefixIcon: Icon(
                          Icons.credit_card,
                          color: _idCardController.text.isNotEmpty
                              ? Colors.lightBlue
                              : Colors.grey,
                          size: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                      ),
                      cursorColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ],
                ),
                gapHeight(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Nomor Kartu Akses",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        gapWidth(4),
                        Text(
                          "(tidak wajib diisi)",
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    gapHeight(8),
                    TextFormField(
                      controller: _accessCardController,
                      style: const TextStyle(
                        color: Colors.lightBlue,
                      ),
                      decoration: InputDecoration(
                        hintText: "Masukkan Nomor Kartu Akses",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        prefixIcon: Icon(
                          Icons.credit_card,
                          color: _accessCardController.text.isNotEmpty
                              ? Colors.lightBlue
                              : Colors.grey,
                          size: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                      ),
                      cursorColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ],
                ),
                gapHeight(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        const Text(
                          "Nama",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Positioned(
                          left: 30,
                          top: -8,
                          child: Text(
                            "*",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    gapHeight(8),
                    TextFormField(
                      controller: _nameController,
                      style: const TextStyle(
                        color: Colors.lightBlue,
                      ),
                      decoration: InputDecoration(
                        hintText: "Nama",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: _nameController.text.isNotEmpty
                              ? Colors.lightBlue
                              : Colors.grey,
                          size: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                      ),
                      cursorColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {});
                      },
                    )
                  ],
                ),
                gapHeight(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        const Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Positioned(
                          left: 30,
                          top: -8,
                          child: Text(
                            "*",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    gapHeight(8),
                    TextFormField(
                      controller: _emailController,
                      style: const TextStyle(
                        color: Colors.lightBlue,
                      ),
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            "@",
                            style: TextStyle(
                              color: _emailController.text.isNotEmpty
                                  ? Colors.lightBlue
                                  : Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {});
                      },
                      cursorColor: Colors.blue,
                    ),
                    if (_emailController.text.isNotEmpty &&
                        !Utility.isValidEmail(_emailController.text))
                      const Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: const Text(
                          'Formal email tidak valid',
                          style: TextStyle(
                            color: Colors.red,
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
                gapHeight(20),
                ElevatedButton(
                  onPressed: isFormValid()
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ConfirmationDataPage(
                                  idCard: _idCardController.text,
                                  accessCard: _accessCardController.text,
                                  name: _nameController.text,
                                  email: _emailController.text,
                                ),
                              ),
                            );
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isFormValid() ? Colors.lightBlue : Colors.grey.shade300,
                    foregroundColor:
                        isFormValid() ? Colors.white : Colors.black87,
                  ),
                  child: const Text("Selanjutnya"),
                ),
                OutlinedButton(
                  onPressed: () async {
                    if (await _onWillPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.cyan,
                    side: const BorderSide(color: Colors.cyan),
                  ),
                  child: const Text("Batal"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
