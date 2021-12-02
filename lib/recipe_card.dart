import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeCard extends StatelessWidget {
  final File? image;
  final String title;
  final String? description;
  final String? prepTime;
  final String? cookTime;
  final String? numServings;
  final String? ingredients;
  final String? instructions;

  RecipeCard({
    this.image,
    required this.title,
    this.description,
    this.prepTime,
    this.cookTime,
    this.numServings,
    this.ingredients,
    this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Color(0xFFFBBA72),
            BlendMode.multiply,
          ),
          image: image != null
              ? Image.file(image!).image
              : Image.asset('assets/food-dish.png').image,
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                child: Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    title,
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 16),
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
              Align(
                child: Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(
                        prepTime != null && prepTime!.trim() != ''
                            ? prepTime!
                            : "N/A",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 16),
                      ),
                      SizedBox(width: 7),
                      Text(
                        "+",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 7),
                      Icon(
                        Icons.schedule,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(
                        cookTime != null && cookTime!.trim() != ''
                            ? cookTime!
                            : "N/A",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                alignment: Alignment.bottomLeft,
              )
            ],
          ),
        ],
      ),
    );
  }
}
