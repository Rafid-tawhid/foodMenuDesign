import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu,color: Colors.black87,),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image:AssetImage('images/tuxedo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 15),
          child: Text("SEARCHING FOR",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
          Padding(padding: EdgeInsets.only(left: 15),
          child: Text("RECEPIES",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
          SizedBox(height: 20,),
          Padding(padding: EdgeInsets.only(left: 15,right: 15),
          child: Container(
            height: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.grey.withOpacity(.1),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search,color: Colors.grey,)
              ),
            ),
          ),
          ),
          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.only(left: 15),
            child: Text("Recomonded",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
          ),
          SizedBox(height: 20,),
          Container(
            height: 200,
            width: 160,
            padding: EdgeInsets.only(top: 5,left: 15),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListItems('Ham Burger','images/burger.png','21',Color(0XFFFFEAC5), Color(0XFF64473a)),
                _buildListItems('Cheese','images/cheese.png','100',Color(0XFFFFEAC5), Color(0XFF64473a)),
                _buildListItems('Doughnut','images/doughnut.png','50',Color(0XFFFFEAC5), Color(0XFF64473a)),
                _buildListItems('Fries','images/fries.png','30',Color(0XFFFFEAC5), Color(0XFF64473a)),
                _buildListItems('Hotdog','images/hotdog.png','50',Color(0XFFFFEAC5), Color(0XFF64473a)),
                _buildListItems('Pizza','images/pizza.png','80',Color(0XFFFFEAC5), Color(0XFF64473a)),
                _buildListItems('Popcorn','images/popcorn.png','20',Color(0XFFFFEAC5), Color(0XFF64473a)),
                _buildListItems('Taco','images/taco.png','60',Color(0XFFFFEAC5), Color(0XFF64473a)),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: TabBar(
              controller: tabController,
              // indicatorColor: Colors.transparent,
              labelColor: Colors.black87,
              unselectedLabelColor: Colors.grey.withOpacity(.5),
              isScrollable: true,
              tabs: [
                Tab(child: Text('Features',),),
                Tab(child: Text('Combo',),),
                Tab(child: Text('Favorites',),),
                Tab(child: Text('Recomonded',),),
              ],

            ),
          )
        ],
      ),
    );

  }
}

_buildListItems(String food,String path,String price,Color bgColor,Color txtColor)
{
  return Padding(padding: EdgeInsets.only(left: 15),
    child: Container(
      height: 175,
      width: 150,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: food,
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,

              ),
              child: Center(
                child: Image.asset(path,height: 50,width: 50,),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(food,style: TextStyle(color: txtColor,fontSize: 20),),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text('\$'+price,style: TextStyle(color: txtColor,fontSize: 22,fontWeight: FontWeight.bold),),
          ),


        ],
      ),
    ),
  );


}
