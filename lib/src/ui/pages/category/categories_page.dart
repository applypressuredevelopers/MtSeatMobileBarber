import 'package:barber_app/constants.dart';
import 'package:barber_app/src/ui/model/CategoryModel.dart';
import 'package:barber_app/src/ui/model/categories_model.dart';
import 'package:barber_app/src/ui/pages/category/service_select.dart';
import 'package:barber_app/src/ui/widgets/bottom_sheet.dart';
import 'package:barber_app/src/utils/nav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utils/images.dart';

class CategoriesListPage extends StatefulWidget {
  const CategoriesListPage({Key? key}) : super(key: key);

  @override
  _CategoriesListPageState createState() => _CategoriesListPageState();
}

class _CategoriesListPageState extends State<CategoriesListPage> {



  String loadingText = "Loading...";
  final _fireStore = FirebaseFirestore.instance;

  final _auth =FirebaseAuth.instance;

  List<CategoryModel> categories =[];

  Future<void> _getData() async {
    QuerySnapshot querySnapshot = await _fireStore.collection('categories').get();
    categories = List.from(querySnapshot.docs.map((doc)=>CategoryModel.fromSnapshot(doc),));
    setState((){
      loadingText = "There are no categories";
    });

  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await _getData();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backGround),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            _buildProfileTop(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65),
              child: SizedBox(
                height: 55,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Center(
                    child: TextFormField(
                      style: const TextStyle(
                          color: Colors.white38, fontStyle: FontStyle.italic),
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white38,
                        ),
                        suffixIcon: const Icon(
                          Icons.filter_list,
                          color: Colors.white38,
                        ),
                        fillColor: Colors.black,
                        hintStyle: const TextStyle(
                            color: Colors.white38, fontStyle: FontStyle.italic),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.white38),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.white38),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.white38),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              categories[i].imageUrl.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          categories[i].categoryName.toString(),
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      selectedCategory = categories[i].categoryName.toString();
                      Appnavigation().push(const ServiceSelection(), context);
                    },
                  );
                },
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: CustomBottomSheet(),
    );
  }

  Widget _buildProfileTop() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset(
              AppImages.backArrow,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Appnavigation().pop(context);
            },
          ),
          const Spacer(),
          const Text(
            'Select Category',
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),
          ),
          const Spacer(),
          Image.asset(
            AppImages.bell,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 5,
          ),
          Image.asset(
            AppImages.cart,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
