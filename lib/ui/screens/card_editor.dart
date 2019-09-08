import 'dart:async';
// import 'dart:convert';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:valise_zefyr/services/zefyr_image_delegate.dart';
import 'package:zefyr/zefyr.dart';

class CardEditor extends StatefulWidget {
  @override
  _CardEditorState createState() => _CardEditorState();
}

class _CardEditorState extends State<CardEditor> {
  /// Allows to control the editor and the document.
  ZefyrController _controller;

  /// Zefyr editor like any other input field requires a focus node.
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _loadDocument().then((document) {
      setState(() {
        _controller = ZefyrController(document);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final theme = new ZefyrThemeData(
      toolbarTheme: ZefyrToolbarTheme.fallback(context).copyWith(
        color: Colors.grey.shade800,
        toggleColor: Colors.grey.shade900,
        iconColor: Colors.white,
        disabledIconColor: Colors.grey.shade500,
      ),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Create Card'),
        actions: <Widget>[
          Builder(
              builder: (context) => IconButton(
                    icon: Icon(Icons.save),
                    onPressed: () => _saveDocument(context),
                  )),
        ],
      ),
      body: ZefyrTheme(
        data: theme,
        child: SafeArea(
          child: _controller == null
              ? Center(child: CircularProgressIndicator())
              : ZefyrScaffold(
                  child: ZefyrEditor(
                    padding: EdgeInsets.all(16),
                    controller: _controller,
                    focusNode: _focusNode,
                    imageDelegate: MyZefyrImageDelegate(),
                  ),
                ),
        ),
      ),
    );
  }

  Future<NotusDocument> _loadDocument() async {
    // final file = File(Directory.systemTemp.path + '/valise_zefyr.json');
    // if (await file.exists()) {
    //   //await file.delete();
    //   final contents = await file.readAsString();
    //   return NotusDocument.fromJson(jsonEncode(contents));
    // }
    final Delta delta = Delta()..insert('Marché des Enfants\n');
    return NotusDocument.fromDelta(delta);
  }

  void _saveDocument(BuildContext context) {
    // Notus documents can be easily serialized to JSON by passing to
    // `jsonEncode` directly

    // TODO: (daniorca) this code needs to be changes to save to Cloud FireStore.

    //final contents = jsonEncode(_controller.document);
    // final file = File(Directory.systemTemp.path + '/valise_zefyr.json');
    // file.writeAsString(contents).then((_) {
    //   Scaffold.of(context).showSnackBar(SnackBar(content: Text('card saved')));
    // });


    Scaffold.of(context).showSnackBar(SnackBar(content: Text('card saved')));
  }
}
