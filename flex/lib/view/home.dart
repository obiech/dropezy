import 'package:flex/bloc/photo_bloc.dart';
import 'package:flex/view/preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Nasa Images', key: Key('title')),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          color: Colors.white,
          onRefresh: () async {
            context.read<PhotoBloc>().add(const PhotoEvent.retrievePhotos());
            Future.delayed(const Duration(seconds: 3));
          },
          child: BlocBuilder<PhotoBloc, PhotoState>(
            builder: (context, state) {
              if (state.status == Status.loading && state.images.isEmpty) {
                return const Center(
                    child: CircularProgressIndicator.adaptive(
                        key: Key('loading_indicator')));
              } else if (state.status == Status.failed) {
                return Center(
                  child: Text(state.error?.errMessage ?? '',
                      key: const Key('error_widget')),
                );
              }
              return ListView.separated(
                itemCount: state.images.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.white,
                  );
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          (MaterialPageRoute(builder: (context) {
                            return Preview(photo: state.images[index]);
                          })));
                    },
                    child: Container(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(state.images[index].url)),
                        )),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
