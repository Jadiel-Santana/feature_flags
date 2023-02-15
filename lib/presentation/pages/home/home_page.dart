import 'package:flutter/material.dart';

import '../../presenters/presenters.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  final ProductsPresenter presenter;

  const HomePage({
    super.key,
    required this.presenter,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.presenter.fetchProducts();
    widget.presenter.checkVersion().then((value) {
      if (value) {
        showDialogUpdate();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feature Flags'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ValueListenableBuilder(
            valueListenable: widget.presenter,
            builder: (_, state, __) {
              if (state is LoadingState) {
                return const CircularProgressIndicator();
              } else if (state is InitialState) {
                return const Center(
                  child: Text('Nenhum produto encontrado'),
                );
              } else if (state is ErrorState) {
                return Text(state.message);
              } else if (state is SuccessState) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.products.length,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemBuilder: (_, index) {
                    return ProductCard(
                      product: state.products[index],
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Future<void> showDialogUpdate() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const DialogUpdate(),
    );
  }

  @override
  void dispose() {
    widget.presenter.dispose();
    super.dispose();
  }
}
