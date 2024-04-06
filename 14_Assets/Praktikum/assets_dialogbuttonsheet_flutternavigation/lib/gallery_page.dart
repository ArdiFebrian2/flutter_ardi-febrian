import 'package:flutter/material.dart';
import 'contact_page.dart';

class GalleryPage extends StatelessWidget {
  final List<String> images = [
    'https://img.freepik.com/free-vector/technology-future-landing-page_23-2148919158.jpg?w=900',
    'https://img.freepik.com/premium-vector/conceptual-background-web-technology_79451-382.jpg?w=996',
    'https://img.freepik.com/premium-vector/flat-landing-page-proposing-new-rfid-technology_82574-9047.jpg?w=996',
    'https://img.freepik.com/free-vector/minimal-technology-twitch-background_23-2149059940.jpg?w=900',
    'https://img.freepik.com/free-vector/artificial-intelligence-concept-twitch-background_23-2150389743.jpg?w=996',
    'https://img.freepik.com/free-vector/flat-minimal-technology-twitch-background_23-2149061674.jpg?w=900',
    'https://img.freepik.com/free-vector/flat-minimal-technology-twitch-background_23-2149066431.jpg?w=900',
    'https://img.freepik.com/free-psd/hand-drawn-technology-landing-page_23-2149819783.jpg?w=1060',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Gallery',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Contact'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewContactsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _showImageConfirmationBottomSheet(context, images[index]);
            },
            child: Image.network(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  void _showImageConfirmationBottomSheet(
      BuildContext context, String imageUrl) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text('Would you like to see this image in more detail?'),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewPage(imageUrl: imageUrl),
                        ),
                      );
                    },
                    child: Text('Yes'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('No'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void main() {
    runApp(MaterialApp(
      home: GalleryPage(),
    ));
  }
}

class ContactPage extends StatelessWidget {
  final String argumentValue;

  ContactPage({required this.argumentValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text('Contact', style: TextStyle(color: Colors.white))),
      body: Center(
        child: Text(argumentValue),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  final String imageUrl;

  NewPage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Image Detail',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
