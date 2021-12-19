import 'package:cached_network_image/cached_network_image.dart';
import 'package:evemts/api/controller/event_api_controller.dart';
import 'package:evemts/models/category.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<Category>> _future;

  List<Category> _categories = <Category>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = EventApiController().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 19,
                color: Color(0xff1B2D49),
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w900,
              ),
            ),
            // I
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/new_event');
                },
                icon: Icon(
                  Icons.add,
                  color: Color(0xff1B2D49),
                ),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Category>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            _categories = snapshot.data ?? [];
            return GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              itemCount: _categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/cat_details');
                      },
                      child: Container(
                        padding: EdgeInsets.all(7),
                        color: Colors.white.withOpacity(0.1),
                        //  height:150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Container(
                                  height: 120,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: _categories[index].image,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 55),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff707070).withOpacity(0.3),
                                  ),
                                  width: 70,
                                  child: Text(
                                    '${_categories[index].eventsCount.toString()} Events',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontFamily: 'Cairo'),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              _categories[index].nameEn,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  color: Color(0xff423E5B)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.warning, size: 80),
                Center(
                  child: Text(
                    'No Data !',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
