import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/widgets/my_text_field.dart';
import '../../controller/products_bloc.dart';
import '../../controller/products_event.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final TextEditingController _searchCtrl = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchCtrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchCtrl.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      final bloc = context.read<ProductsBloc>();
      final selectedSlug = bloc.selectedCategory?.slug;
      bloc.add(FetchProducts(searchText: query.isNotEmpty ? query : null, categorySlug: selectedSlug));
    });
  }

  void _clearSearch() {
    _searchCtrl.clear();
    final bloc = context.read<ProductsBloc>();
    final selectedSlug = bloc.selectedCategory?.slug;
    bloc.add(FetchProducts(categorySlug: selectedSlug?.isNotEmpty == true ? selectedSlug : null));
  }

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: _searchCtrl,
      hintText: "Search products...",
      suffix:
          _searchCtrl.text.isNotEmpty
              ? GestureDetector(onTap: _clearSearch, child: const Icon(Icons.close))
              : const Icon(Icons.search),
      onChanged: _onSearchChanged,
    );
  }
}
