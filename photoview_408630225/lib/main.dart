import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp(const MyApp());
}
int pindex=0;
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'photoview_408630225',
      home: photogallery(title:'ButterGallery'),
    );
  }
}

class photogallery extends StatelessWidget {
  final String title;
  List <String> image=const[
    'image/1.jpg',
    'image/2.jpg',
    'image/3.jpg',
    'image/4.jpg',
    'image/5.jpg',
    'image/6.jpg',
    'image/7.jpg',
    'image/8.jpg',
  ];
  photogallery({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text(title),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        color: Colors.amberAccent,
        child:RawScrollbar(
          thumbColor: Colors.grey,
          thickness: 10,
          child:GridView.count(
            padding: const EdgeInsets.all(10),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.15,
            physics:  ScrollPhysics(),
            children:<Widget> [
              Container(
                color:Colors.white,
                child:InkWell(
                    onTap: () => openGallery(0,context),
                    child: Image.asset(
                        image[0],
                    )
                ),
              ),
              Container(
                color:Colors.white,
                child:InkWell(
                    onTap: () => openGallery(1,context),
                    child: Image.asset(image[1])
                ),
              ),
              Container(
                color:Colors.white,
                child:InkWell(
                    onTap: () => openGallery(2,context),
                    child: Image.asset(image[2])
                ),
              ),
              Container(
                color:Colors.white,
                child:InkWell(
                    onTap: () => openGallery(3,context),
                    child: Image.asset(image[3])
                ),
              ),
              Container(
                color:Colors.white,
                child:InkWell(
                    onTap: () => openGallery(4,context),
                    child: Image.asset(image[4])
                ),
              ),
              Container(
                color:Colors.white,
                child:InkWell(
                    onTap: () => openGallery(5,context),
                    child: Image.asset(image[5])
                ),
              ),
              Container(
                color:Colors.white,
                child:InkWell(
                    onTap: () => openGallery(6,context),
                    child: Image.asset(image[6])
                ),
              ),
              Container(
                color:Colors.white,
                child:InkWell(
                    onTap: () => openGallery(7,context),
                    child: Image.asset(image[7])
                ),
              ),
            ],
          ),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Push me!'),
        onPressed: (){
          final text = SnackBar(
            content: Text('I love Rabbit!!!'),
            action: SnackBarAction(
              label: 'Push me',
              onPressed: (){
                Fluttertoast.showToast(
                  msg: 'So do I!!',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                );
              },
            )
          );
          ScaffoldMessenger.of(context).showSnackBar(text);
        },

      ),
    );
  }
  void openGallery(_index,context) {
    pindex=_index;
    Navigator.push(
      context, MaterialPageRoute(
      builder: (context) =>
          GalleryWidget(
            images: image, index: _index,
          ),
    ),
    );
  }
}
class GalleryWidget extends StatefulWidget{
  final List<String> images;
  final int index;
  GalleryWidget({required this.images,required this.index});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GalleryWidgetState();
  }
}
class _GalleryWidgetState extends State<GalleryWidget>{
  PageController _pc =PageController(initialPage: pindex);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PhotoViewGallery.builder(
        itemCount: widget.images.length,
        pageController: _pc,
        enableRotation: false,
        builder: (context,index){
          final _images = widget.images[index];
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(_images),
            minScale: PhotoViewComputedScale.contained*0.1,
            maxScale: PhotoViewComputedScale.covered*2,
          );
        },

        onPageChanged: (int index){
          setState(() {
            pindex=index;
          });
        },
      ),
    );
  }
}


