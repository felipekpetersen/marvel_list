import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_list/core/common/colors.dart';
import 'package:marvel_list/core/common/text_style.dart';

import '../../../core/common/strings.dart';
import 'controller/cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeCubit get _homeCubit => BlocProvider.of<HomeCubit>(context);
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _homeCubit.getCharacters();

    _scrollController.addListener(() {
      var nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger) {
        _homeCubit.getMoreCharacters();
      }
    });

    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeLoading) {
        return _loadingWidget;
      } else if (state is HomeLoaded) {
        return _loadedScreen;
      }
      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: const Text('Marvel List'),
        ),
        body: Container(),
      );
    });
  }

  // UI configuration
  EdgeInsets get _edgeInsets => const EdgeInsets.all(8);
  BoxDecoration get _boxDecoration => const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      );
  Size get _horizontalImageSize => const Size(100, 100);
  Size get _verticalImageSize => const Size(60, 60);
  SizedBox get _verticalSpacing => const SizedBox(height: 8);
SizedBox get _horizontalSpacing => const SizedBox(width: 8);

  Widget get _loadingWidget => const Center(
        child: CircularProgressIndicator(),
      );

  Widget get _loadedScreen => Scaffold(appBar: _customAppBar, body: _body);

  AppBar get _customAppBar => AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          AppStrings.appName,
          style: AppTextStyle.appBarTitleStyle,
        ),
      );

  Widget get _body => Container(
        color: AppColors.backgroundColor,
        child: SingleChildScrollView(
          controller: _scrollController,
            child: Column(children: [
              _horizontalList,
              _verticalList
            ]),
          ),
      );

  Widget get _horizontalList => SizedBox(
        height: 200,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _homeCubit.state.horizontalCharacters.length,
            itemBuilder: (context, index) {
              return _heroHorizontalTile(index);
            }),
      );

  Widget get _verticalList => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _homeCubit.state.verticalCharacters.length,
        itemBuilder: (context, index) {
          return _verticalTile(index);
        },
      );

  Widget _heroHorizontalTile(int index) => Container(
      padding: _edgeInsets,
      margin: _edgeInsets,
      width: 150,
      decoration: _boxDecoration,
      child: Column(
        children: [
          _heroImage(
            '${_homeCubit.state.horizontalCharacters[index].thumbnail?.path ?? ''}.${(_homeCubit.state.horizontalCharacters[0].thumbnail?.extension ?? '')}',
            _horizontalImageSize
          ),
          _verticalSpacing,
          Text(
            _homeCubit.state.horizontalCharacters[index].name ?? '',
            style: AppTextStyle.tileStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ));

  Widget _verticalTile(int index) => Container(
        padding: _edgeInsets,
        margin: _edgeInsets,
        decoration: _boxDecoration,
        child: Row(children: [
          _heroImage(
            '${_homeCubit.state.verticalCharacters[index].thumbnail?.path ?? ''}.${(_homeCubit.state.verticalCharacters[0].thumbnail?.extension ?? '')}',
            _verticalImageSize
          ),
          _horizontalSpacing,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _homeCubit.state.verticalCharacters[index].name ?? '',
                  style: AppTextStyle.tileStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  _homeCubit.state.verticalCharacters[index].description ?? '',
                  style: AppTextStyle.descriptionStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ]),
      );

  Widget _heroImage(String image, Size size) => Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: CachedNetworkImage(
          imageUrl: image,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.white,),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
}
