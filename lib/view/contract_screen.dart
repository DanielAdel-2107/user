import 'package:firstapp/constance.dart';
import 'package:firstapp/controller/animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContractScreen extends StatelessWidget {
  const ContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contract',
        style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        backgroundColor: primaryColor,
        ),
        body: SafeArea(
          child: GetBuilder<AnimationControl>(
          init: AnimationControl(),
          builder: (controllerr) => ListView.builder(
              itemCount: 1,
              padding: const EdgeInsets.only(top: 8),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final int count = 10;
                    //controller.listOfCards.length > 10 ? 10 : controller.listOfCards.length;
                final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: controllerr.animationController!,
                            curve: Interval(
                                (1 / count) * index, 1.0,
                                curve: Curves.fastOutSlowIn)));
                controllerr.animationController?.forward();
                return AnimatedBuilder(
              animation: controllerr.animationController!,
              builder: (BuildContext context, Widget? child) {
                return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
              0.0,
              50 * (1.0 - animation.value),
              0.0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 8,
                bottom: 16,
              ),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: (){
                 // Get.to(PropertyDetailsScreen(model: controller.listOfCards[index]));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(4, 4),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Column(
          children: <Widget>[
            // AspectRatio(
            //   aspectRatio: 2,
            //   child: Image.asset(
            //     'assets/building.png',
            //     fit: BoxFit.cover,
            //   ),
            // ),
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 8,
                      bottom: 8,
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: <Widget>[
                       const Text(
                          'sold property contract',
                          //controller.listOfCards[index].type.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                        Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.center,
                          mainAxisAlignment:
                              MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'maadi',
                                //controller.propertyModel[index].locationn.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey
                                      .withOpacity(0.8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: const [
                        Icon(Icons.bed, color: Colors.blue),
                        Text(' 3 Beds'),
                        SizedBox(width: 10),
                        Icon(Icons.bathtub, color: Colors.blue),
                        Text(' 2 Baths'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    child: Text(
                      '250000',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
                        ),
                        // Positioned(
                        //   top: 8,
                        //   right: 8,
                        //   child: Material(
                        //     color: Colors.transparent,
          //   child: InkWell(
          //     borderRadius: const BorderRadius.all(
          //       Radius.circular(32.0),
          //     ),
          //     onTap: () {},
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: GestureDetector(
          //         onTap: (){
          //         // controller.toggleFavourites(controller.listOfCards[index]);
          //         },
          // child: controller.isExist(controller.listOfCards[index]) == false? Icon(Icons.favorite_border): Icon(Icons.favorite, color: Colors.red,)                                      ),
          //     ),
          //   ),
                         // ),
                        //)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
                );
              },
            );
              },
            ),
          )
          ),
    );
  }
}