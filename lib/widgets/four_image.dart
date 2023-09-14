// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:imageword/widgets/image_model.dart';

// ignore: must_be_immutable
class FourImage extends StatefulWidget {
  List<String> imageList;
  FourImage({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  @override
  State<FourImage> createState() => _FourImageState();
}

class _FourImageState extends State<FourImage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(widget.imageList[index]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                      );
                    },
                    itemCount: widget.imageList.length,
                  );
  }
}