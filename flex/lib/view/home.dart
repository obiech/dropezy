import 'package:flex/bloc/photo_bloc.dart';
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
    return RefreshIndicator(
      onRefresh: () async {
        context.read<PhotoBloc>().add(const PhotoEvent.retrievePhotos());
        Future.delayed(const Duration(seconds: 3));
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Nasa Images'),
            centerTitle: true,
          ),
          body: BlocBuilder<PhotoBloc, PhotoState>(
            builder: (context, state) {
              if (state.status == Status.loading) {
                return const Center(
                    child: CircularProgressIndicator.adaptive(
                        key: Key('loading_indicator')));
              } else if (state.status == Status.failed) {
                return Center(
                  child: Text(state.error?.errMessage ?? '',
                      key: Key('error_widget')),
                );
              }
              return ListView.separated(
                itemCount: state.images.length,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(state.images[index].url)),
                  ));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
