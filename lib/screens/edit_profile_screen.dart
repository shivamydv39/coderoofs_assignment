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
      title: 'Edit Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
        ),
      ),
      home: const EditProfileScreen(),
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, size: 20),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              // Handle visibility toggle
              print('Visibility toggled');
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.visibility_outlined, size: 24),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Grid
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.8,
              children: List.generate(6, (index) {
                return GestureDetector(
                  onTap: () {
                    print('Image ${index + 1} tapped');
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.grey[200],
                          image: DecorationImage(
                            image: AssetImage('assets/image${index + 1}.jpg'),
                            //assets/image6.jpg
                            fit: BoxFit.cover,
                            onError: (exception, stackTrace) {
                              // Handle image loading error
                            },
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.1),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (index == 0)
                         Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Text(
                              'Main',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            print('Remove image ${index + 1}');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: 32),
            
            // Your Details Section
            const Text(
              'Your details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            
            // Profile Details List
            _buildDetailItem(
              icon: Iconsax.user, 
              label: 'About me (Bio)',
              onTap: () => print('About me tapped'),
            ),
            _buildDetailItem(
              icon: Iconsax.heart_search,
              label: 'What are you looking for?',
              onTap: () => print('What are you looking for tapped'),
            ),
            _buildDetailItem(
              icon: Iconsax.user,
              label: 'Gender',
              onTap: () => print('Gender tapped'),
            ),
            _buildDetailItem(
              icon: Iconsax.setting2,
              label: 'Birthday (Age)',
              onTap: () => print('Birthday tapped'),
            ),
            _buildDetailItem(
              icon: Iconsax.profile,
              label: 'Height',
              onTap: () => print('Height tapped'),
            ),
            _buildDetailItem(
              icon: Iconsax.like,
              label: 'Interested in?',
              onTap: () => print('Interested in tapped'),
            ),
            _buildDetailItem(
              icon: Iconsax.user,
              label: 'Sexuality',
              onTap: () => print('Sexuality tapped'),
            ),
            _buildDetailItem(
              icon: Iconsax.user,
              label: 'Relationship',
              onTap: () => print('Relationship tapped'),
            ),
            _buildDetailItem(
              icon: Iconsax.user,
              label: 'Ethnicity',
              onTap: () => print('Ethnicity tapped'),
            ),
            _buildDetailItem(
              icon: Iconsax.user,
              label: 'Kids',
              onTap: () => print('Kids tapped'),
            ),
            _buildDetailItem(
              icon: Iconsax.user,
              label: 'Drinking',
              onTap: () => print('Drinking tapped'),
            ),
            _buildDetailItem(
              icon: Iconsax.user,
              label: 'Smoking',
              onTap: () => print('Smoking tapped'),
            ),
            _buildDetailItem(
              icon: Iconsax.user,
              label: 'Marijuana',
              onTap: () => print('Marijuana tapped'),
            ),
            _buildDetailItem(
              icon: Iconsax.user,
              label: 'Religious Beliefs',
              onTap: () => print('Religious Beliefs tapped'),
            ),
            _buildDetailItem(
              icon: Iconsax.user,
              label: 'Political Views',
              onTap: () => print('Political Views tapped'),
            ),
            _buildDetailItem(
              icon: Iconsax.star,
              label: 'Interest and Hobbies',
              onTap: () => print('Interest and Hobbies tapped'),
            ),
            _buildDetailItem(
              icon: Iconsax.user,
              label: 'Values & Lifestyle',
              onTap: () => print('Values & Lifestyle tapped'),
            ),
            
            const SizedBox(height: 32),
            
            // Discover Perfect Match Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                children: [
                  const Text(
                    'Discover your Perfect Match',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  
                  // Profile Images Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        margin: EdgeInsets.only(
                          left: index > 0 ? 8 : 0,
                          right: index < 2 ? 8 : 0,
                        ),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: AssetImage('assets/images/match${index + 1}.jpg'),
                          onBackgroundImageError: (exception, stackTrace) {
                            // Handle image loading error
                          },
                        ),
                      );
                    }),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Take Quiz Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Take the quiz again tapped');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7B2CBF),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Take the quiz again',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black87,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.black38,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}