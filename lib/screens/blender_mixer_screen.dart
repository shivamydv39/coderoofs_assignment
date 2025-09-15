import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mixer',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
        ),
      ),
      home: const MixerScreen(),
    );
  }
}

class MixerScreen extends StatefulWidget {
  const MixerScreen({super.key});

  @override
  State<MixerScreen> createState() => _MixerScreenState();
}

class _MixerScreenState extends State<MixerScreen> {
  String selectedPlan = 'mixer'; // 'mixer' or 'mixer_vip'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black87),
        ),
        title: const Text(
          'Mixer',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.close, size: 24, color: Colors.grey),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Level Up Your Mixer Experience',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Select a plan',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            
            // Plan Cards
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPlan = 'mixer';
                      });
                    },
                    child: _buildPlanCard(
                      title: 'Mixer',
                      price: '\$24.99',
                      description: 'All of the below',
                      isSelected: selectedPlan == 'mixer',
                      icon: Icons.favorite,
                      iconColor: const Color(0xFFE91E63),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPlan = 'mixer_vip';
                      });
                    },
                    child: _buildPlanCard(
                      title: 'Mixer VIP',
                      price: '\$99.99',
                      description: selectedPlan == 'mixer_vip' 
                        ? 'All 3 + VIP seating,\nfood, and beverages'
                        : 'Mixer + VIP seating,\nfood & beverages',
                      isSelected: selectedPlan == 'mixer_vip',
                      icon: Icons.favorite,
                      iconColor: const Color(0xFFFFA726),
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Features Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedPlan == 'mixer_vip' ? 'Included with Mixer VIP' : 'Included with Mixer',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureItem('Unlimited Likes'),
                  _buildFeatureItem('See who liked you'),
                  _buildFeatureItem('Find people with wide range'),
                  _buildFeatureItem('Access to events'),
                  if (selectedPlan == 'mixer_vip')
                    _buildFeatureItem('VIP seating, food & beverages'),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Continue Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('Continue with ${selectedPlan == 'mixer' ? '\$24.99' : '\$99.99'}');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedPlan == 'mixer' 
                    ? const Color(0xFFAB47BC)  // Purple for Mixer
                    : const Color(0xFFFFA726), // Orange for Mixer VIP
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image9.png',
                      width: 24,
                      height: 27,
                        ),
                    const SizedBox(width: 8),
                    Text(
                      'Continue - ${selectedPlan == 'mixer' ? '\$24.99' : '\$99.99'} total',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Terms Text
            const Text(
              'By continuing, you agree to be charged, with auto-renewal until canceled in App Store settings, under Mixer\'s Terms.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black45,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required String description,
    required bool isSelected,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? iconColor.withOpacity(0.5) : Colors.grey[200]!,
          width: isSelected ? 2 : 1,
        ),
        boxShadow: isSelected ? [
          BoxShadow(
            color: iconColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ] : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              Container(
                child: Image.asset(
                  'assets/image9.png',
                  width: 27,
                  height: 27,
                  color: iconColor,
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          Text(
            price,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: title == 'Mixer VIP' ? const Color(0xFFFFA726) : const Color(0xFFAB47BC),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(
            Icons.check,
            color: selectedPlan == 'mixer' ? const Color(0xFFAB47BC) : const Color(0xFFFFA726),
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}