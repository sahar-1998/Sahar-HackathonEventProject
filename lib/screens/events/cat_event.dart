import 'package:cached_network_image/cached_network_image.dart';
import 'package:evemts/api/controller/event_api_controller.dart';
import 'package:evemts/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late Future<List<Event>> _future;

  List<Event> _event = <Event>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = EventApiController().showEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                alignment: AlignmentDirectional.bottomCenter,
                height: 200,
                width: 500,
                color: HexColor('#253975'),
                child: const CircleAvatar(
                  radius: 50,
                  //backgroundImage: AssetImage('images/5.png'),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 13, left: 90, right: 89),
            child: Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'Category Name',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: HexColor('#3E3A57')),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 14, left: 165, right: 164),
            child: const Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  '12 Event',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: Colors.red),
                )),
          ),
          FutureBuilder<List<Event>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                _event = snapshot.data ?? [];
                return GridView.builder(
                  physics: BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  itemCount: _event.length,
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
                            Navigator.pushNamed(
                                context, '/event_detail_screen');
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 79,
                                width: 97,
                                child: CachedNetworkImage(
                                  imageUrl: _event[index].image,
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, top: 19),
                                    child: Container(
                                      height: 15,
                                      width: 89,
                                      child: Text(
                                        '${_event[index].durationHours} : ${_event[index].time}',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: HexColor('#8E8B9D')),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Container(
                                      height: 15,
                                      width: 89,
                                      child: Text(
                                        _event[index].name,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: HexColor('#423E5B')),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Container(
                                        height: 15,
                                        width: 89,
                                        child: Text(
                                          _event[index].date,
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: HexColor('#423E5B')),
                                        )),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 16, right: 36),
                                    child: Align(
                                      alignment: AlignmentDirectional.topEnd,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: HexColor('#FBFBFC'),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        width: 48,
                                        height: 20,
                                        child: Text('Active'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
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
        ],
      ),
    );
  }
}
