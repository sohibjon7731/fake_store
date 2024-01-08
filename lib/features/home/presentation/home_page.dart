import 'package:fake_store/features/home/presentation/blocs/product_bloc.dart';
import 'package:fake_store/features/home/presentation/pages/single_product.dart';
import 'package:fake_store/features/home/presentation/widgets/error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({Key? key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FakeStore'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state.status == LoadingStatus.pure) {
          context.read<ProductBloc>().add(ProductBlocStarted());
          return const SizedBox();
        } else if (state.status == LoadingStatus.loadingWithFailure) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ErrorPage(),
            ),
          );
        } else if (state.status == LoadingStatus.loading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state.status == LoadingStatus.loadingWithSuccsess) {
          final list = state.products;

          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.5),
              itemCount: list.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (_) => SingleProductPage(
                                product: list[index],
                              )));
                    },
                    child: Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: double.maxFinite,
                              height: 80,
                              child: Image.network(list[index].image),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              list[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              list[index].description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'price : \$${list[index].prize.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )));
              });
        }
        return SizedBox();
      }),
    );
  }
}
