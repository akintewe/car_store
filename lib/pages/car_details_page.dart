import 'package:car_marketplace_ui/models/saved_car_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarDetailsPage extends StatefulWidget {
  const CarDetailsPage({Key? key, required this.savedCar}) : super(key: key);

  final SavedCarModel savedCar;
  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            widget.savedCar.img,
            width: double.infinity,
            height: screenSize.height * 0.4,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              height: screenSize.height * 0.66,
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      height: screenSize.height * 0.63,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.savedCar.year,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.savedCar.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    widget.savedCar.price,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MaterialButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: FittedBox(
                                      child: Text(
                                        widget.savedCar.speed,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      fit: BoxFit.contain,
                                    ),
                                    color: Colors.grey[200],
                                  ),
                                  MaterialButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: FittedBox(
                                      child: Text(
                                        widget.savedCar.color,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      fit: BoxFit.contain,
                                    ),
                                    color: Colors.grey[200],
                                  ),
                                  MaterialButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: FittedBox(
                                      child: Text(
                                        widget.savedCar.location,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      fit: BoxFit.contain,
                                    ),
                                    color: Colors.grey[200],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Model S',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ,Content here',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Details',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ,Content here',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        radius: screenSize.width * 0.09,
                        child: Icon(
                          CupertinoIcons.heart_fill,
                          size: screenSize.width * 0.09,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SafeArea(
                child: IconButton(
              icon:
                  const Icon(FontAwesomeIcons.x, size: 20, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
          )
/*          SizedBox(
              width: double.infinity,
              height: screenSize.height*0.3,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Image.asset(
                      'assets/img/jpg/captiva.jpg',
                    width: double.infinity,
                    height: screenSize.height*0.3,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SafeArea(
                        child: IconButton(
                          icon: const Icon(FontAwesomeIcons.x,size: 20,color: Colors.white,),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        )
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.redAccent,
                          radius: 10,
                          child: Icon(CupertinoIcons.heart_fill,size: 5,color: Colors.white,)),
                    )
                  ],
                )
            )*/
        ],
      ),
    );
  }
}
