import 'dart:convert';

import 'package:car_marketplace_ui/models/car_model.dart';
import 'package:car_marketplace_ui/models/saved_car_model.dart';
import 'package:car_marketplace_ui/pages/car_details_page.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class CarStorePage extends StatefulWidget {
  const CarStorePage({
    Key? key,
  }) : super(key: key);

  @override
  State<CarStorePage> createState() => _CarStorePageState();
}

class _CarStorePageState extends State<CarStorePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/json/car_list.json'),
      builder: (context, snapshot) {
        debugPrint('builder');
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SizedBox(
            height: screenSize.height * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Browse',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                ConditionalBuilder(
                  condition: snapshot.data != null,
                  builder: (context) {
                    var result = json.decode(snapshot.data.toString())
                        as Map<String, dynamic>;
                    List mainCars = result["main_cars"];
                    List<CarModel> listOfCarModel =
                        mainCars.map((e) => CarModel.fromJson(e)).toList();
                    return SizedBox(
                      height: screenSize.height * 0.22,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => _buildCarListItem(
                              screenSize: screenSize,
                              car: listOfCarModel[index]),
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 15),
                          itemCount: listOfCarModel.length),
                    );
                  },
                  fallback: (context) => const Center(
                      child: CircularProgressIndicator(
                    color: Colors.grey,
                  )),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        const WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Icon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        TextSpan(
                            text: 'Saved',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700))
                      ]),
                    ),
                    Text(
                      '16 saved cars',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.grey[500]),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: snapshot.data != null,
                    builder: (context) {
                      var result = json.decode(snapshot.data.toString());
                      List savedCars = result["saved_cars"];
                      List<SavedCarModel> listOfSavedCarModel = savedCars
                          .map((e) => SavedCarModel.fromJson(e))
                          .toList();
                      return ListView.separated(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) => _buildSingleSavedCar(
                              screenSize: screenSize,
                              savedCar: listOfSavedCarModel[index]),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: listOfSavedCarModel.length);
                    },
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCarListItem({required Size screenSize, required CarModel car}) =>
      SizedBox(
        width: screenSize.width * 0.4,
        child: Card(
          elevation: 5,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    CircleAvatar(
                      radius: screenSize.width * 0.12,
                      backgroundColor: HexColor(car.carColor),
                    ),
                    Image.asset(
                      car.carPicture,
                      width: screenSize.width * 0.35,
                      height: screenSize.height * 0.11,
                      fit: BoxFit.contain,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      car.categoryName,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      car.carQuantity,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );

  Widget _buildSingleSavedCar(
          {required Size screenSize, required SavedCarModel savedCar}) =>
      InkWell(
        child: SizedBox(
          height: screenSize.height * 0.17,
          child: Card(
            color: Colors.white,
            clipBehavior: Clip.hardEdge,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(
                        savedCar.img,
                        height: screenSize.height * 0.15,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          savedCar.year,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          savedCar.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              savedCar.speed,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              savedCar.color,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              savedCar.price,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 20,
                      child: const Icon(
                        FontAwesomeIcons.solidHeart,
                        color: Colors.black26,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => CarDetailsPage(savedCar: savedCar)));
        },
      );
}
