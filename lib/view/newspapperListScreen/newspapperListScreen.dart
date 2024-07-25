import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/controller/newspapper_info_controller.dart';
import 'package:rest_api/model/newspapper_info_model.dart';
import 'package:rest_api/view/Loginscreen/Loginscreen.dart';
import 'package:rest_api/view/newspapperDetailScreen/newspapperDetailScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Newspapperlistscreen extends StatefulWidget {
  @override
  _NewspapperlistscreenState createState() => _NewspapperlistscreenState();
}

class _NewspapperlistscreenState extends State<Newspapperlistscreen> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the screen is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NewspapperController>(context, listen: false).getDatas();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<NewspapperController>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Newspapers'),
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();

                prefs.clear();

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (route) => false);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: controller.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.newspaperDatas.length,
              itemBuilder: (context, index) {
                final newspaper = controller.newspaperDatas[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 18,
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newspaper.title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                              'Place of Publication: ${newspaper.placeOfPublication}'),
                          Text('Start Year: ${newspaper.startYear}'),
                          Text('End Year: ${newspaper.endYear}'),
                          Text('Publisher: ${newspaper.publisher}'),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Newspapperdetailscreen(
                                      newspaper: newspaper),
                                ),
                              );
                            },
                            child: Text('More Details'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
