import 'package:flutter/material.dart';
import 'package:final_tugas/pages/home.dart';

class DescriptionPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
   final List<String> additionalImages; // Daftar gambar tambahan

  const DescriptionPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.additionalImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
            GestureDetector(
              onTap: () {
                _showImagePopup(context, imageUrl);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imageUrl,
                  width: screenWidth * 1,
                  height: screenHeight * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(Icons.aspect_ratio, color: Colors.white),
                    onPressed: () {
                      _showImagePopup(context, imageUrl);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              textAlign: TextAlign.justify,
              description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
           SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: additionalImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(

                   onTap: () {
                          // Arahkan ke bagian masing-masing
                          _navigateToImageDetail(context, additionalImages[index]);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            additionalImages[index],
                            width: 100, // Set a fixed width for each image
                            height: 100, // Set a fixed height for each image
                            fit: BoxFit.cover,
                          ),
                        ),
                  );
                },
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }

  void _showImagePopup(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SingleChildScrollView(
          
            child: InteractiveViewer(
              maxScale: 4.0, // Mendukung zoom hingga 4x
              minScale: 0.5, // Zoom-out hingga 0.5x
              child: Image.asset(imageUrl),
            ),
          
          ),
        );
      },
    );
  }
    void _navigateToImageDetail(BuildContext context, String imageUrl) {
    // Navigasi ke halaman detail gambar
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageDetailPage(imageUrl: imageUrl), // Ganti dengan halaman detail yang sesuai
      ),
    );
  }
}
class ImageDetailPage extends StatelessWidget {
  final String imageUrl;

  const ImageDetailPage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Gambar'),
      ),
      body: Center(
        child: InteractiveViewer(
          maxScale: 4.0,
          minScale: 0.5,
          child: Image.asset(imageUrl),
        ),
      ),
    );
  }
}
// void _showVisualSearchPopup(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Icons.search, size: 32, color: Colors.blue),
//                 SizedBox(width: 16),
//                 Text(
//                   "Visual Search Activated",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
