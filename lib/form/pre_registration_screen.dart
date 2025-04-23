import 'package:caliana_clone/components/bottom_sheet_confirmation.dart';
import 'package:caliana_clone/components/bottom_sheet_date.dart';
import 'package:caliana_clone/components/pop_up_time.dart';
import 'package:caliana_clone/form/confirmation_data_screen.dart';
import 'package:caliana_clone/utility/divider.dart';
import 'package:caliana_clone/utility/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PreRegistrationScreen extends StatefulWidget {
  const PreRegistrationScreen({super.key});

  @override
  _PreRegistrationScreenState createState() => _PreRegistrationScreenState();
}

class _PreRegistrationScreenState extends State<PreRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _idCardController = TextEditingController();
  final TextEditingController _accessCardController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  int _selectedHour = 0;
  int _selectedMinute = 0;
  DateTime? _selectedDate;
  bool _isTimeInvalid = false;

  bool isFormValid() {
    return _nameController.text.isNotEmpty && _emailController.text.isNotEmpty;
  }

  Future<void> _showTimePicker() async {
    // Set initial values to current time when opening the picker if not already set
    if (_timeController.text.isEmpty) {
      final now = TimeOfDay.now();
      _selectedHour = now.hour;
      _selectedMinute = now.minute;
    }

    final TimeOfDay? pickedTime = await showModalBottomSheet<TimeOfDay>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return CustomTimePicker(
          initialHour: _selectedHour,
          initialMinute: _selectedMinute,
        );
      },
    );

    if (pickedTime != null) {
      final now = TimeOfDay.now();
      final isInvalid = pickedTime.hour < now.hour ||
          (pickedTime.hour == now.hour && pickedTime.minute <= now.minute);

      setState(() {
        _selectedHour = pickedTime.hour;
        _selectedMinute = pickedTime.minute;
        _timeController.text =
            '${_selectedHour.toString().padLeft(2, '0')}:${_selectedMinute.toString().padLeft(2, '0')}';
        _isTimeInvalid = isInvalid;
      });
    }
  }

  Future<void> _showDatePicker() async {
    final DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return CalendarBottomSheet(
          initialDate: _selectedDate ?? DateTime.now(),
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('d MMMM yyyy').format(pickedDate);
      });
    }
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
              'Formulir Pra Registrasi',
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
                gapHeight(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
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
                        Text(
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
                gapHeight(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Tanggal Kunjungan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
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
                    GestureDetector(
                      onTap: _showDatePicker,
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: _dateController,
                          style: const TextStyle(
                            color: Colors.lightBlue,
                          ),
                          decoration: InputDecoration(
                            hintText: "Pilih Tanggal",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 12,
                            ),
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: _dateController.text.isNotEmpty
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
                          readOnly: true, // Ini biar keyboard nggak muncul
                          cursorColor: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                gapHeight(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Waktu Kunjungan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4),
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
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: _showTimePicker,
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: _timeController,
                          style: const TextStyle(
                            color: Colors.lightBlue,
                          ),
                          decoration: InputDecoration(
                            hintText: "Pilih Jam",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            prefixIcon: Icon(
                              Icons.access_time,
                              color: _timeController.text.isNotEmpty
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
                          readOnly: true,
                          cursorColor: Colors.blue,
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    if (_isTimeInvalid)
                      const Padding(
                        padding: EdgeInsets.only(top: 4, left: 8),
                        child: Text(
                          'Waktu sudah terlewat',
                          style: TextStyle(
                            color: Colors.red,
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
                gapHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: const Text(
                    'Rentang Waktu Kunjungan Pengunjung :',
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                  ),
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
                  child: const Text("Check In"),
                ),
                OutlinedButton(
                  onPressed: () async {
                    if (await _onWillPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.cyan,
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
