import 'dart:convert';

import 'package:car_marketplace_ui/models/filter_model.dart';
import 'package:car_marketplace_ui/models/saved_car_model.dart';
import 'package:car_marketplace_ui/widgets/popup_nested_menu.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String initialFilter = 'Price';
  int _current = 0;
  final _nameFilterController =
      TextEditingController(text: 'Chevrolet Captive');
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final List<FilterModel> carFilterModels = [
      FilterModel(title: 'price', usbFilters: [
        FilterModel(title: 'low to high'),
        FilterModel(title: 'high to low'),
      ]),
      FilterModel(title: 'speed', usbFilters: [
        FilterModel(title: 'low to high'),
        FilterModel(title: 'high to low'),
      ])
    ];
/*    final List<Widget> sliderItems = [
      _buildSliderItem(screenSize: screenSize),
      _buildSliderItem(screenSize: screenSize),
      _buildSliderItem(screenSize: screenSize),
      _buildSliderItem(screenSize: screenSize),
      _buildSliderItem(screenSize: screenSize),
    ];*/
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString(('assets/json/car_list.json')),
      builder: (_, snapshot) {
        if (snapshot.data == null) {
          return const CircularProgressIndicator();
        }
        var result =
            json.decode(snapshot.data.toString()) as Map<String, dynamic>;
        final List savedCars = result['saved_cars'];
        final List<SavedCarModel> savedCarModels =
            savedCars.map((e) => SavedCarModel.fromJson(e)).toList();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SizedBox(
            height: screenSize.height * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FIND',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: screenSize.width * 0.5,
                  child: TextFormField(
                    controller: _nameFilterController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 3),
                      isDense: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pinkAccent,
                          width: 2,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.pinkAccent, width: 2)),
                      disabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.pinkAccent, width: 2)),
                    ),
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: (value) {
                      for (var element in savedCarModels) {
                        if (element.name == value) {
                          _current = savedCarModels.indexOf(element);
                        }
                      }
                      setState(() {});
                    },
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'SORT BY',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.grey),
                ),
                PopupNestedMenu(filterModel: carFilterModels),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                        height: screenSize.height * 0.5,
                        autoPlay: true,
                        autoPlayCurve: Curves.easeInExpo,
                        enableInfiniteScroll: true,
                        aspectRatio: 1.5,
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        autoPlayInterval: const Duration(seconds: 2),
                        enlargeCenterPage: true,
                        pageSnapping: true,
                        initialPage: _current,
                        onPageChanged: (index, _) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    itemCount: savedCarModels.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) =>
                            _buildSliderItem(
                                screenSize: screenSize,
                                index: index,
                                car: savedCarModels[index]),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSliderItem(
          {required Size screenSize,
          required int index,
          required SavedCarModel car}) =>
      SizedBox(
        width: screenSize.width * 0.75,
        height: screenSize.height * 0.5,
        child: Card(
          color: Colors.white,
          clipBehavior: Clip.hardEdge,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    car.img,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      car.year,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          car.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                        ),
                        Text(
                          car.price,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: MaterialButton(
                              color: Colors.grey[200],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: FittedBox(
                                child: Text(
                                  car.speed,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(color: Colors.black),
                                ),
                                fit: BoxFit.contain,
                              ),
                              onPressed: () {}),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: MaterialButton(
                              color: Colors.grey[200],
                              child: FittedBox(
                                child: Text(
                                  car.color,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(color: Colors.black),
                                ),
                                fit: BoxFit.contain,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {}),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: MaterialButton(
                              color: Colors.grey[200],
                              child: FittedBox(
                                  child: Text(
                                    car.location,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(color: Colors.black),
                                  ),
                                  fit: BoxFit.contain),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {}),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
