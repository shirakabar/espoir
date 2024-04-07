import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CarouselContainerbox extends StatelessWidget{
  const CarouselContainerbox({required this.img,required this.title,super.key});

  final String img;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
      child: Container(
      width: double.infinity, //横無限
      height: 210,
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        )),
      child: Container(
      width: double.infinity, //横無限
      height: 210,
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color.fromARGB(150, 0, 0, 0),
                    ],
                    stops: [
                      0.7,
                      1,
                    ],
                  ), 
        ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical:15),
        child: Align(alignment: Alignment.bottomLeft,
                   child: Text(title,style: const TextStyle(color:Colors.white,fontSize: 23,fontWeight: FontWeight.bold))
      )
      )
        ),
    ),
        );
  }
}

class Button extends StatelessWidget {
  //outlinedbuttonのクラスを作成し、使いまわす
  const Button(
      {required this.label, required this.rout, required this.icon, super.key});
  final String label;
  final String rout;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          context.push(rout);
        },
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: const BorderSide(color: Colors.transparent),
            fixedSize: const Size(135, 50)),
        child: Column(
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            Text(
              label,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
