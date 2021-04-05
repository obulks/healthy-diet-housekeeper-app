import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  SearchBar({
    Key key,
    this.borderRadius = 20,
    this.autoFocus = false,
    this.focusNode,
    this.controller,
    this.height = 40,
    this.value,
    this.leading,
    this.suffix,
    this.actions = const [],
    this.hintText,
    this.onTap,
    this.onClear,
    this.onCancel,
    this.onChanged,
    this.onSearch,
  }) : super(key: key);
  final double borderRadius;
  final bool autoFocus;
  final FocusNode focusNode;
  final TextEditingController controller;

  // 输入框高度 默认40
  final double height;

  // 默认值
  final String value;

  // 最前面的组件
  final Widget leading;

  // 搜索框后缀组件
  final Widget suffix;
  final List<Widget> actions;

  // 提示文字
  final String hintText;

  // 输入框点击
  final VoidCallback onTap;

  // 单独清除输入框内容
  final VoidCallback onClear;

  // 清除输入框内容并取消输入
  final VoidCallback onCancel;

  // 输入框内容改变
  final ValueChanged onChanged;

  // 点击键盘搜索
  final ValueChanged onSearch;

  @override
  _SearchBarState createState() => _SearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _controller;
  FocusNode _focusNode;

  bool get isFocus => _focusNode.hasFocus;

  bool get isTextEmpty => _controller.text.isEmpty;

  bool get isActionEmpty => widget.actions.isEmpty;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    if (widget.value != null) _controller.text = widget.value;
    // 监听输入框状态
    _focusNode.addListener(() => setState(() {}));
    super.initState();
  }

  // 清除输入框内容
  void _onClearInput() {
    setState(() {
      _controller.clear();
    });
    widget.onClear?.call();
  }

  // 取消输入框编辑
  void _onCancelInput() {
    setState(() {
      _controller.clear();
      _focusNode.unfocus();
    });
    widget.onCancel?.call();
  }

  void _onInputChanged(String value) {
    widget.onChanged?.call(value);
  }

  Widget _suffix() {
    if (!isTextEmpty) {
      return GestureDetector(
        onTap: _onClearInput,
        child: SizedBox(
          width: widget.height,
          height: widget.height,
          child: Icon(Icons.cancel, size: 22, color: Color(0xFF999999)),
        ),
      );
    }
    return widget.suffix ?? SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    final ScaffoldState scaffold = Scaffold.of(context);
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      height: widget.height,
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Row(
        children: [
          SizedBox(
            width: widget.height,
            height: widget.height,
            child: Icon(Icons.search, size: 22, color: Color(0xFF999999)),
          ),
          Expanded(
            child: TextField(
              cursorWidth: 1,
              cursorColor: Colors.black,
              autofocus: widget.autoFocus,
              focusNode: _focusNode,
              controller: _controller,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: widget.hintText ?? '请输入关键字',
                hintStyle: TextStyle(fontSize: 15, color: Color(0xFF999999)),
              ),
              style: TextStyle(
                  fontSize: 15, color: Color(0xFF333333), height: 1.3),
              textInputAction: TextInputAction.search,
              onTap: widget.onTap,
              onChanged: _onInputChanged,
              onSubmitted: widget.onSearch,
            ),
          ),
          _suffix(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    _focusNode?.dispose();
    super.dispose();
  }
}
