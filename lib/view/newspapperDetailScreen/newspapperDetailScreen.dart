import 'package:flutter/material.dart';
import 'package:rest_api/model/newspapper_info_model.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this dependency

class Newspapperdetailscreen extends StatelessWidget {
  final NewspaperModel newspaper;

  Newspapperdetailscreen({required this.newspaper});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newspaper.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                newspaper.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Place of Publication: ${newspaper.placeOfPublication}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Start Year: ${newspaper.startYear}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'End Year: ${newspaper.endYear}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Publisher: ${newspaper.publisher}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Subjects:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...newspaper.subjects
                  .map((subject) => Text('- $subject'))
                  .toList(),
              SizedBox(height: 16),
              Text(
                'Note:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(newspaper.notes.toString()),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final url = newspaper.url;
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text('View Original'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
