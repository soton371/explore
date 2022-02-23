import 'package:explore/controllers/timeline.dart';
import 'package:explore/views/image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled)=>[
              SliverAppBar(
                backgroundColor: Colors.white,
                floating: true,
                snap: true,
                title: Text("Explore",
                style: TextStyle(
                  color: Colors.black
                ),
                ),
                centerTitle: true,
                leading: Icon(Icons.menu, color: Colors.black,),
                actions: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/images/propic.jpg'),
                  ),
                  SizedBox(width: 15,)
                ],
              )
            ],
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  //for search
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.2
                        ),
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Beautiful, free photos',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 15
                          ),
                          prefixIcon: Icon(Icons.search)
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  //for grid view
                  Expanded(
                    child: StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      staggeredTileBuilder: (index)=>StaggeredTile.fit(1),
                        itemCount: TimeLine().imageList.length,
                        itemBuilder: (_,index){
                          var data = TimeLine().imageList;
                          return GestureDetector(
                            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageViewScreen(image_index: index,))),
                            child: ClipRRect(
                                child: Image(image: AssetImage(data[index].image),fit: BoxFit.cover,),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        },
                    )
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}


