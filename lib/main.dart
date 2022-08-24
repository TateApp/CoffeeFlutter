import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class CoffeeDataModel {
  final String text;
  final String image;
  final String price;

  CoffeeDataModel(this.text, this.image, this.price);
}

List<CoffeeDataModel> menu = [
  CoffeeDataModel('Cinnamon & Cocoa', 'images/Coffee2.png', '£99'),
  CoffeeDataModel('Dizzled with caramel', 'images/Coffee3.png', '£99'),
  CoffeeDataModel('Bursting Blueberry', 'images/Coffee4.png', '£99'),
  CoffeeDataModel('Dalgona Whipped Mocha', 'images/Coffee5.png', '£99'),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Rosarivo'),
      home: const Scaffold(
        body: FirstScreen(),
      ),
    );
  }
}

const Color coffeeBrown1 = Color.fromRGBO(32, 19, 32, 1.0);
const Color coffeeBrown2 = Color.fromRGBO(238, 227, 200, 1.0);
const Color coffeeBrown3 = Color.fromRGBO(55, 44, 54, 1.0);
const Color coffeeBrown5 = Color.fromRGBO(135, 124, 116, 1.0);
const Color coffeeBrown6 = Color.fromRGBO(24, 16, 23, 1.0);

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: coffeeBrown1,
      child: Stack(children: [
        CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Coffee',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: coffeeBrown2, fontSize: 40),
                                ),
                                Text(
                                  'Brew',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: coffeeBrown5, fontSize: 40),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  color: coffeeBrown2,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(25)),
                              child: const SizedBox(
                                width: 50,
                                height: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        //Row 1
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: coffeeBrown6),
                            child: SizedBox(
                              height: 50,
                              width: screenWidth,
                              child: Row(children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset('images/Search.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Browse Your Favourite Coffee...',
                                  style: TextStyle(color: coffeeBrown5),
                                )
                              ]),
                            ),
                          ),
                        )
                      ],
                    ),
                    GridView.builder(
                        padding: EdgeInsets.all(10),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 20,
                                childAspectRatio: 0.65),
                        itemCount: menu.length,
                        itemBuilder: (context, index) {
                          return CoffeeWidgetView(coffee: menu[index]);
                        })
                  ]),
            )
          ],
        ),
        Column(
          children: [
            const Spacer(),
            Container(
              color: Colors.black,
              child: SizedBox(
                width: screenWidth,
                height: 100,
                child: Row(
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 50,
                    ),
                    Image.asset('images/Home.png'),
                    SizedBox(
                      width: 50,
                    ),
                    Image.asset('images/Cart.png'),
                    SizedBox(
                      width: 50,
                    ),
                    Image.asset('images/Heart.png'),
                    SizedBox(
                      width: 50,
                    ),
                    Image.asset('images/Bell.png'),
                    SizedBox(
                      width: 50,
                    ),
                    Spacer()
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}

class CoffeeWidgetView extends StatelessWidget {
  final CoffeeDataModel coffee;

  const CoffeeWidgetView({Key? key, required this.coffee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: coffeeBrown3,
            borderRadius: BorderRadiusDirectional.circular(20)),
        child: SizedBox(
          width: 150,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Container(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(coffee.image),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                coffee.text,
                style: TextStyle(fontSize: 15, color: coffeeBrown2),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: coffeeBrown1),
                child: SizedBox(
                  width: 110,
                  height: 50,
                  child: Stack(children: [
                    Center(
                      child: Stack(
                        children: [
                          Text(
                            coffee.price,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Row(children: [
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              color: coffeeBrown2,
                              borderRadius: BorderRadius.circular(20)),
                          child: const SizedBox(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text('+'),
                            ),
                          ),
                        )
                      ]),
                    )
                  ]),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
