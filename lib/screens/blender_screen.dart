import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blind Mixer',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFFFAF9FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFAF9FC),
          foregroundColor: Colors.black87,
          elevation: 0,
        ),
      ),
      home: const BlindMixerScreen(),
    );
  }
}

class BlindMixerScreen extends StatefulWidget {
  const BlindMixerScreen({super.key});

  @override
  State<BlindMixerScreen> createState() => _BlindMixerScreenState();
}

class _BlindMixerScreenState extends State<BlindMixerScreen> {
  bool hasApplied = false;
  bool showForm = false;

  @override
  Widget build(BuildContext context) {
    if (showForm) {
      return const BlindMixerFormScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blind Mixer',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        centerTitle: false,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: const Icon(
              Iconsax.flash_circle,
              size: 24,
              color: Color(0xFF8E24AA),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16, left: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Icon(
              Iconsax.notification,
              size: 24,
              color: Color(0xFF8E24AA),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              height: 190,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'assets/vector2.png',
                fit: BoxFit.contain,
              ),
            ),
            
            const SizedBox(height: 50),
            
            // Content Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Text(
                    'Upcoming Blind Date',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Let Mixer surprise you with a match.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  
                  // Date Container
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Iconsax.calendar,
                          size: 18,
                          color: Color(0xFF8E24AA),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'September 28 - 10 PM',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 60),
                  
                  // Process Steps
                  if (!hasApplied) ...[
                    const Text(
                      'Sign Up • Smart Match • Blind Date',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF8E24AA),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                  ],
                  
                  // Action Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: hasApplied ? null : () {
                        setState(() {
                          showForm = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: hasApplied 
                          ? Colors.white 
                          : const Color(0xFF8E24AA),
                        foregroundColor: hasApplied 
                          ? const Color(0xFF8E24AA) 
                          : Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: hasApplied 
                            ? BorderSide(color: Colors.grey[300]!)
                            : BorderSide.none,
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (hasApplied)
                            const Icon(
                              Icons.check,
                              size: 20,
                              color: Color(0xFF8E24AA),
                            ),
                          if (!hasApplied)
                            const Icon(
                              Icons.filter_list,
                              size: 20,
                              color: Colors.white,
                            ),
                          const SizedBox(width: 8),
                          Text(
                            hasApplied ? 'Applied for Blind Mixer' : 'Fill out the Form',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: hasApplied 
                                ? const Color(0xFF8E24AA)
                                : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}

class BlindMixerFormScreen extends StatefulWidget {
  const BlindMixerFormScreen({super.key});

  @override
  State<BlindMixerFormScreen> createState() => _BlindMixerFormScreenState();
}

class _BlindMixerFormScreenState extends State<BlindMixerFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _bioController = TextEditingController();
  final _interestsController = TextEditingController();
  final _lookingForController = TextEditingController();
  
  String _selectedGender = '';
  String _selectedPreference = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, size: 20),
        ),
        title: const Text(
          'Blind Date Application',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tell us about yourself',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Help us find your perfect match for the blind date',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 32),
              
              // Name Field
              _buildTextField(
                controller: _nameController,
                label: 'Full Name',
                hint: 'Enter your full name',
                validator: (value) => value?.isEmpty == true ? 'Please enter your name' : null,
              ),
              
              // Age Field
              _buildTextField(
                controller: _ageController,
                label: 'Age',
                hint: 'Enter your age',
                keyboardType: TextInputType.number,
                validator: (value) => value?.isEmpty == true ? 'Please enter your age' : null,
              ),
              
              // Gender Selection
              _buildSectionTitle('Gender'),
              Row(
                children: [
                  Expanded(child: _buildGenderOption('Male')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildGenderOption('Female')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildGenderOption('Other')),
                ],
              ),
              const SizedBox(height: 24),
              
              // Preference Selection
              _buildSectionTitle('Looking for'),
              Row(
                children: [
                  Expanded(child: _buildPreferenceOption('Male')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildPreferenceOption('Female')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildPreferenceOption('Any')),
                ],
              ),
              const SizedBox(height: 24),
              
              // Bio Field
              _buildTextField(
                controller: _bioController,
                label: 'About You',
                hint: 'Tell us about yourself...',
                maxLines: 4,
                validator: (value) => value?.isEmpty == true ? 'Please tell us about yourself' : null,
              ),
              
              // Interests Field
              _buildTextField(
                controller: _interestsController,
                label: 'Interests & Hobbies',
                hint: 'What do you enjoy doing?',
                maxLines: 3,
              ),
              
              // What you're looking for
              _buildTextField(
                controller: _lookingForController,
                label: 'What are you looking for?',
                hint: 'Describe your ideal date/partner',
                maxLines: 3,
              ),
              
              const SizedBox(height: 40),
              
              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8E24AA),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Submit Application',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[500]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF8E24AA)),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildGenderOption(String gender) {
    bool isSelected = _selectedGender == gender;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF8E24AA).withOpacity(0.1) : Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFF8E24AA) : Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          gender,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? const Color(0xFF8E24AA) : Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _buildPreferenceOption(String preference) {
    bool isSelected = _selectedPreference == preference;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPreference = preference;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF8E24AA).withOpacity(0.1) : Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFF8E24AA) : Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          preference,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? const Color(0xFF8E24AA) : Colors.black54,
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedGender.isEmpty || _selectedPreference.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select your gender and preference'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Process form data
      Map<String, dynamic> formData = {
        'name': _nameController.text,
        'age': _ageController.text,
        'gender': _selectedGender,
        'preference': _selectedPreference,
        'bio': _bioController.text,
        'interests': _interestsController.text,
        'lookingFor': _lookingForController.text,
      };

      print('Form submitted: $formData');
      
      // Show success message and navigate back
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Application submitted successfully!'),
          backgroundColor: Color(0xFF8E24AA),
        ),
      );

      // Navigate back to main screen with applied state
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _bioController.dispose();
    _interestsController.dispose();
    _lookingForController.dispose();
    super.dispose();
  }
}