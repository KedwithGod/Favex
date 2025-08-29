import '/model/utilities/imports/shared.dart';

class CryptoSelectorBottomSheet extends StatefulWidget {
  final List<Map<String, dynamic>> cryptoList; // List of cryptocurrencies
  final String selectText; // Text to display as the title
  final String searchHint; // Hint for the search field
  final Function(int) onSelect; // Callback for selection

  const CryptoSelectorBottomSheet({
    Key? key,
    required this.cryptoList,
    required this.selectText,
    required this.searchHint,
    required this.onSelect,
  }) : super(key: key);

  @override
  _CryptoSelectorBottomSheetState createState() => _CryptoSelectorBottomSheetState();
}

class _CryptoSelectorBottomSheetState extends State<CryptoSelectorBottomSheet> {
  List<Map<String, dynamic>> filteredCryptoList = [];
  final TextEditingController searchController = TextEditingController();
    FocusNode searchFocusNode = FocusNode();
  int? selectedCryptoIndex;

  @override
  void initState() {
    super.initState();
    filteredCryptoList = List.from(widget.cryptoList); // Initialize with provided list
    searchController.addListener(_filterCryptoList);
  }

  void _filterCryptoList() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredCryptoList = widget.cryptoList
          .where((crypto) => crypto['name'].toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      color: colorsBucket!.white,
      height: 440,
      width: 375,
      child: Column(
        children: [
          // Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterText(widget.selectText),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: GeneralIconDisplay(Icons.close,
                    colorsBucket!.title, UniqueKey(), 15),
              )
            ],
          ),
          S(h: 34),
          // Search Field
          FormattedTextFields(
            textFieldController: searchController,
            textFieldHint: widget.searchHint,
            onChangedFunction: (value) {},
            errorTextActive: false,
            focusNode: searchFocusNode,
            errorText: '',
            containerColor: colorsBucket!.borderDisabled,
            prefixIcon: S(
              h: 56,
              w: 40,
              child: Row(
                children: [
                  S(w: 10),
                  const SvgPngImage(path: 'search', height: 16, width: 16),
                  S(w: 5),
                ],
              ),
            ),
          ),
          S(h: 22),
          // Crypto List
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final crypto = filteredCryptoList[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCryptoIndex = index;
                    });
                    widget.onSelect(index); // Call the onSelect method
                    Navigator.pop(context); // Close the bottom sheet
                  },
                  child: GeneralContainer(
                    color: colorsBucket!.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPngImage(
                          path: crypto['icon'],
                          height: 40,
                          width: 41,
                          imageType: ImageTypeEnum.png,
                        ),
                        S(w: 10),
                        InterText(
                          crypto['name'],
                          textAlign: TextAlign.center,
                          textFontSize: 12,
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Column(
                  children: [
                    S(h: 16),
                    const DividerWidget(),
                    S(h: 16),
                  ],
                );
              },
              itemCount: filteredCryptoList.length,
            ),
          ),
        ],
      ),
    );
  }
}