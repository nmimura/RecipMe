import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'recipe_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RecipMe',
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/recipme_logo.png',
                height: 40,
                width: 40,
              ),
              Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    'RecipMe',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )),
            ],
          ),
          backgroundColor: Color(0xFFF68C13),
        ),
        body: const MainPage(),
        backgroundColor: Color(0xFFF68C13),
      ),
      theme: ThemeData(primaryColor: Color(0xFFF68C13)),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.headerValue,
    required this.color,
    this.isExpanded = false,
  });

  String headerValue;
  Color color;
  bool isExpanded;
}

final listTileTitles = [
  'drinks',
  'appetizers / sides',
  'main dishes',
  'desserts'
];
final listTileColors = [
  Color(0xFFE25F12),
  Color(0xFFBB4D00),
  Color(0xFF8F250C),
  Color(0xFF691E06)
];

// List<Item> generateItems(int numberOfItems) {
//   return List<Item>.generate(numberOfItems, (int index) {
//     return Item(
//       headerValue: listTileTitles[index],
//       color: listTileColors[index],
//       id: index,
//     );
//   });
// }

int? lastExpanded;

File? _image;

String title = "";
String? description, prepTime, cookTime, numServings, ingredients, instructions;

/// This is the stateful widget that the main application instantiates.
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

/// This is the private State class that goes with MainPage.
class _MainPageState extends State<MainPage> {
  //final List<Item> _data = generateItems(4);

  int _count = 0;
  Item item1 = new Item(
    headerValue: listTileTitles[0],
    color: listTileColors[0],
    isExpanded: false,
  );
  Item item2 = new Item(
    headerValue: listTileTitles[1],
    color: listTileColors[1],
    isExpanded: false,
  );
  Item item3 = new Item(
    headerValue: listTileTitles[2],
    color: listTileColors[2],
    isExpanded: false,
  );
  Item item4 = new Item(
    headerValue: listTileTitles[3],
    color: listTileColors[3],
    isExpanded: false,
  );
  List<RecipeCard> _recipes1 = [];
  List<RecipeCard> _recipes2 = [];
  List<RecipeCard> _recipes3 = [];
  List<RecipeCard> _recipes4 = [];
  bool item1Tapped = false;
  bool item2Tapped = false;
  bool item3Tapped = false;
  bool item4Tapped = false;

  void _addNewRecipe1(int i) {
    setState(() {
      _count = _count + i;
      if (i > 0) {
        RecipeCard card = new RecipeCard(
          image: _image,
          title: title,
          description: description,
          prepTime: prepTime,
          cookTime: cookTime,
          numServings: numServings,
          ingredients: ingredients,
          instructions: instructions,
        );
        _recipes1.add(card);
        print(card.prepTime);
      }
    });
  }

  void _addNewRecipe2(int i) {
    setState(() {
      _count = _count + i;
      if (i > 0) {
        RecipeCard card = new RecipeCard(
          image: _image,
          title: title,
          description: description,
          prepTime: prepTime,
          cookTime: cookTime,
          numServings: numServings,
          ingredients: ingredients,
          instructions: instructions,
        );
        _recipes2.add(card);
        print(card.prepTime);
      }
    });
  }

  void _addNewRecipe3(int i) {
    setState(() {
      _count = _count + i;
      if (i > 0) {
        RecipeCard card = new RecipeCard(
          image: _image,
          title: title,
          description: description,
          prepTime: prepTime,
          cookTime: cookTime,
          numServings: numServings,
          ingredients: ingredients,
          instructions: instructions,
        );
        _recipes3.add(card);
        print(card.prepTime);
      }
    });
  }

  void _addNewRecipe4(int i) {
    setState(() {
      _count = _count + i;
      if (i > 0) {
        RecipeCard card = new RecipeCard(
          image: _image,
          title: title,
          description: description,
          prepTime: prepTime,
          cookTime: cookTime,
          numServings: numServings,
          ingredients: ingredients,
          instructions: instructions,
        );
        _recipes4.add(card);
        print(card.prepTime);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          switch (index) {
            case 0:
              {
                item1.isExpanded = !isExpanded;
              }
              break;

            case 1:
              {
                item2.isExpanded = !isExpanded;
              }
              break;

            case 2:
              {
                item3.isExpanded = !isExpanded;
              }
              break;

            case 3:
              {
                item4.isExpanded = !isExpanded;
              }
              break;
          }
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                item1.headerValue,
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontSize: 20, letterSpacing: 2),
              ),
            );
          },
          body: Column(children: [
            ListTile(
                title: Text(
                  'Add a new recipe to this category',
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
                trailing: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          //elevation: 16,
                          child: Container(
                            child: MyCustomForm(
                              update: _addNewRecipe1,
                            ),
                            padding: EdgeInsets.all(20),
                          ),
                        );
                      });
                }),
            if (_recipes1.length > 0)
              Column(
                children: _recipes1.map<RecipeCard>((card) {
                  return card;
                }).toList(),
              )
          ]),
          isExpanded: item1.isExpanded,
          backgroundColor: item1.color,
        ),
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                item2.headerValue,
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontSize: 20, letterSpacing: 2),
              ),
            );
          },
          body: Column(children: [
            ListTile(
                title: Text(
                  'Add a new recipe to this category',
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
                trailing: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          //elevation: 16,
                          child: Container(
                            child: MyCustomForm(
                              update: _addNewRecipe2,
                            ),
                            padding: EdgeInsets.all(20),
                          ),
                        );
                      });
                }),
            if (_recipes2.length > 0)
              Column(
                children: _recipes2.map<RecipeCard>((card) {
                  return card;
                }).toList(),
              )
          ]),
          isExpanded: item2.isExpanded,
          backgroundColor: item2.color,
        ),
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                item3.headerValue,
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontSize: 20, letterSpacing: 2),
              ),
            );
          },
          body: Column(children: [
            ListTile(
                title: Text(
                  'Add a new recipe to this category',
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
                trailing: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          //elevation: 16,
                          child: Container(
                            child: MyCustomForm(
                              update: _addNewRecipe3,
                            ),
                            padding: EdgeInsets.all(20),
                          ),
                        );
                      });
                }),
            if (_recipes3.length > 0)
              Column(
                children: _recipes3.map<RecipeCard>((card) {
                  return card;
                }).toList(),
              )
          ]),
          isExpanded: item3.isExpanded,
          backgroundColor: item3.color,
        ),
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                item4.headerValue,
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontSize: 20, letterSpacing: 2),
              ),
            );
          },
          body: Column(children: [
            ListTile(
                title: Text(
                  'Add a new recipe to this category',
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
                trailing: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          //elevation: 16,
                          child: Container(
                            child: MyCustomForm(
                              update: _addNewRecipe4,
                            ),
                            padding: EdgeInsets.all(20),
                          ),
                        );
                      });
                }),
            if (_recipes4.length > 0)
              Column(
                children: _recipes4.map<RecipeCard>((card) {
                  return card;
                }).toList(),
              )
          ]),
          isExpanded: item4.isExpanded,
          backgroundColor: item4.color,
        )
      ],
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  final ValueChanged<int> update;

  MyCustomForm({required this.update});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState(update: update);
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  final titleContr = TextEditingController();
  final descriptionContr = TextEditingController();
  final prepContr = TextEditingController();
  final cookContr = TextEditingController();
  final servingsContr = TextEditingController();
  final ingredientsContr = TextEditingController();
  final instructionsContr = TextEditingController();

  final ValueChanged<int> update;

  MyCustomFormState({required this.update});

  _imgFromCamera() async {
    File image = (await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50));

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = (await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50));

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                  new ListTile(
                      leading: new Icon(Icons.cancel),
                      title: new Text('Remove Photo'),
                      onTap: () {
                        setState(() {
                          _image = null;
                        });
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
          );
        });
  }

  Map recipes = new Map();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
              child: Container(
            child: Text(
              'New Recipe',
              style: GoogleFonts.montserrat(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.only(bottom: 15),
          )),
          GestureDetector(
            onTap: () {
              _showPicker(context);
            },
            child: _image == null
                ? Container(
                    child: Icon(Icons.add_a_photo_outlined),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 30),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      _image!,
                      width: 150,
                      height: 150,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name for this recipe';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Recipe Name',
            ),
            controller: titleContr,
          ),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
            controller: descriptionContr,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Prep Time',
            ),
            controller: prepContr,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Cook Time',
            ),
            controller: cookContr,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: '# of Servings',
            ),
            controller: servingsContr,
          ),
          TextFormField(
            minLines: 5,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Ingredients',
            ),
            controller: ingredientsContr,
          ),
          TextFormField(
            minLines: 10,
            maxLines: 10,
            decoration: const InputDecoration(
              hintText: 'Directions',
            ),
            controller: instructionsContr,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 100, top: 40),
                child: new ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 10, top: 40.0),
                  child: new ElevatedButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      title = titleContr.text;
                      description = descriptionContr.text;
                      prepTime = prepContr.text;
                      cookTime = cookContr.text;
                      numServings = servingsContr.text;
                      ingredients = ingredientsContr.text;
                      instructions = instructionsContr.text;
                      Navigator.of(context).pop();
                      recipes[title] = <Widget>[
                        RecipeCard(
                          image: _image,
                          title: title,
                          description: description,
                          prepTime: prepTime,
                          cookTime: cookTime,
                          numServings: numServings,
                          ingredients: ingredients,
                          instructions: instructions,
                        )
                      ];
                      print(recipes);
                      update(1);
                      _image = null;
                      title = "";
                      description = null;
                      prepTime = null;
                      cookTime = null;
                      numServings = null;
                      ingredients = null;
                      instructions = null;
                      // add recipe to this list tile
                    },
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
