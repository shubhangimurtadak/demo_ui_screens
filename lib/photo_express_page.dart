import 'package:demoflutterapp/model/select_image_model.dart';
import 'package:demoflutterapp/widgets/appbottombar_layout_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class PhotoExpressPage extends StatefulWidget {
  const PhotoExpressPage({super.key, required this.imgList});
  final List<String> imgList;
  @override
  State<PhotoExpressPage> createState() => _PhotoExpressPageState();
}

class _PhotoExpressPageState extends State<PhotoExpressPage> {
  List<SelectImageModel> selectedImg = [];
  int selectedCount = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.imgList.forEach((element) {
        selectedImg.add(SelectImageModel(img: element, isSelected: false));
        setState(() {});
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomBarLayoutWidget(
      title: 'CVC Photo Express',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Photos (${selectedImg.length})',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Select all',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Text(
                      'Photos have been scaled and cropped to reflect the slected size',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 12),

                    Expanded(
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        //padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1.5,
                        children: List.generate(
                          selectedImg.length + 1,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                if (index != 0) {
                                  selectedImg[index - 1].isSelected =
                                      !selectedImg[index - 1].isSelected;
                                  slectedImages();
                                }
                              });
                            },
                            child: Container(
                              //height: 80,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                                border:
                                    index == 0
                                        ? Border.all(
                                          color: Colors.grey.shade300,
                                        )
                                        : selectedImg[index - 1].isSelected ==
                                            true
                                        ? Border.all(
                                          color: Colors.red,
                                          width: 2,
                                        )
                                        : null,
                              ),

                              child:
                                  index == 0
                                      ? Icon(Icons.add)
                                      : ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            Image.network(
                                              selectedImg[index - 1].img,
                                              fit: BoxFit.cover,
                                            ),

                                            if (selectedImg[index - 1]
                                                    .isSelected ==
                                                true)
                                              Positioned.fill(
                                                child: Container(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      fixedButton:
          selectedCount != 0
              ? ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: EdgeInsets.all(18),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Remove slected photos ($selectedCount)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.indigo,
                  ),
                ),
              )
              : DottedBorder(
                dashPattern: [5, 2],
                strokeWidth: 1,
                radius: Radius.circular(30),
                color: Colors.grey,

                borderType: BorderType.RRect,
                //),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    color: const Color.fromARGB(255, 236, 232, 232),
                    child: Text(
                      'Select photos to remove',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
    );
  }

  slectedImages() {
    selectedCount =
        selectedImg
            .where((element) => element.isSelected == true)
            .toList()
            .length;
  }
}
