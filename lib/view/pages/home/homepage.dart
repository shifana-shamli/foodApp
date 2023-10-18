
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginpage/service/api_service.dart';
import 'package:loginpage/utils/app_color.dart';
import 'package:loginpage/utils/app_constant.dart';
import 'package:loginpage/view/shimmer/home_shimmer.dart';
import 'package:loginpage/view/widgets/app_text_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/no_internet_connection.dart';
import '../cart/cart_model.dart';
import '../login/loginpage.dart';
import 'bloc/productlist_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ProductlistBloc productListBloc;

  @override
  void initState() {
    super.initState();
    productListBloc =
        ProductlistBloc(RepositoryProvider.of<APIService>(context));
    productListBloc.add(ProductApiEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => productListBloc,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          actions: [
            IconButton(
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  await preferences.clear();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false);
                },
                icon: const Icon(
                  Icons.logout,
                  color: AppColor.black,
                )),
          ],
          title: appTextView(name: 'HOME PAGE',fontSize: 17),
          centerTitle: true,
          backgroundColor: AppColor.greenAccent,
         // leading: const Icon(Icons.arrow_back, color: AppColor.white),
        ),
        body: BlocConsumer<ProductlistBloc, ProductlistState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadedState) {
              if (state.response.status == "success") {
                return GridView.builder(
                  padding: commonPaddingAll,
                  itemCount: state.response.productModel!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      mainAxisSpacing: 10, // spacing between rows
                      crossAxisSpacing: 10,
                      childAspectRatio: 3 / 3.5
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: commonPaddingAll,
                      elevation: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 110,
                            width: 250,
                            child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                                child: Image.network(
                                   state.response.productModel![index].image.toString())),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          appTextView(name:state.response.productModel![index].name.toString(),fontSize: 12),
                                          appTextView(name: state.response.productModel![index].description.toString(),fontSize: 10),
                                          appTextView(name:"price: ${state.response.productModel![index].price}",fontSize: 10),


                                        ],
                                      ),
                                    ),
                                    IconButton(onPressed: (){
                                      cartList.add(CartModel(
                                         state.response.productModel![index].image.toString(),
                                          state.response.productModel![index].name.toString(),
                                          state.response.productModel![index].price.toString(),
                                           1
                                      ));
                                      Navigator.pushNamed(context, "/cart");
                                    }, icon: Icon(Icons.add)),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            }
            else if(state is LoadingState){
             return homeShimmer(context);
            }else if( state is UnAuthorizedState){


            }
            else if( state is NoInternetState){
              // log(">>>>>>");
              return noInternet(context, "/home", 10, 10);
            }

            return Container(height: 150,width: 150,color: Colors.red,);
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed:() {
          Navigator.pushNamed(context, "/cart");
        },
          backgroundColor: AppColor.greenAccent,
          child: const Icon(Icons.shop,color: AppColor.black,),),
      ),
    );
  }
}
