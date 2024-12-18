import 'package:flutter/material.dart';
import 'package:instagram_flutter/widgets/take_photo.dart';

class CameraScreen extends StatefulWidget {
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int _currentIndex = 2;
  PageController _pageController = PageController(initialPage: 1);
  String _title = 'Photo';

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(_title))),
      body: PageView(
        controller: _pageController,
        children: [
          Container(
            color: Colors.cyanAccent,
          ),
          TakePhoto(),
          Container(
            color: Colors.greenAccent,
          ),
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;

            switch (_currentIndex) {
              case 0:
                _title = 'Gallery';
                break;
              case 1:
                _title = 'Photo';
                break;
              case 2:
                _title = 'Video';
                break;
            }
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.radio_button_checked),
            title: Text('GALLERY'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio_button_checked),
            title: Text('PHOTO'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio_button_checked),
            title: Text('VIDEO'),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              _currentIndex,
              duration: Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
            );
          });
        },
      ),
    );
  }
}
