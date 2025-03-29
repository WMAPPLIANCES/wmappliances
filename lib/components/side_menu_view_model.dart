import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'side_menu_view_widget.dart' show SideMenuViewWidget;
import 'package:flutter/material.dart';

class SideMenuViewModel extends FlutterFlowModel<SideMenuViewWidget> {
  ///  Local state fields for this component.

  double paddingLayout = 12.0;

  double paddingItem = 12.0;

  double iconSize = 24.0;

  double menuSize = 74.0;

  double logoSize = 32.0;

  /// New
  List<TicketsRow> newTicket = [];
  void addToNewTicket(TicketsRow item) => newTicket.add(item);
  void removeFromNewTicket(TicketsRow item) => newTicket.remove(item);
  void removeAtIndexFromNewTicket(int index) => newTicket.removeAt(index);
  void insertAtIndexInNewTicket(int index, TicketsRow item) =>
      newTicket.insert(index, item);
  void updateNewTicketAtIndex(int index, Function(TicketsRow) updateFn) =>
      newTicket[index] = updateFn(newTicket[index]);

  List<UsersRow> newUser = [];
  void addToNewUser(UsersRow item) => newUser.add(item);
  void removeFromNewUser(UsersRow item) => newUser.remove(item);
  void removeAtIndexFromNewUser(int index) => newUser.removeAt(index);
  void insertAtIndexInNewUser(int index, UsersRow item) =>
      newUser.insert(index, item);
  void updateNewUserAtIndex(int index, Function(UsersRow) updateFn) =>
      newUser[index] = updateFn(newUser[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for MenuHover widget.
  bool menuHoverHovered = false;
  // State field(s) for MenuLoho widget.
  bool menuLohoHovered = false;
  // State field(s) for ItenHover widget.
  bool itenHoverHovered1 = false;
  // State field(s) for ItenHover widget.
  bool itenHoverHovered2 = false;
  // State field(s) for ItenHover widget.
  bool itenHoverHovered3 = false;
  // State field(s) for ItenHover widget.
  bool itenHoverHovered4 = false;
  // State field(s) for ItenHover widget.
  bool itenHoverHovered5 = false;
  // State field(s) for ItenHover widget.
  bool itenHoverHovered6 = false;
  // State field(s) for ItenHover widget.
  bool itenHoverHovered7 = false;
  // State field(s) for ItenHover widget.
  bool itenHoverHovered8 = false;
  // State field(s) for ItenHover widget.
  bool itenHoverHovered9 = false;
  // State field(s) for ItenHover widget.
  bool itenHoverHovered10 = false;
  // State field(s) for ItenHover widget.
  bool itenHoverHovered11 = false;
  // State field(s) for newUser widget.
  bool newUserHovered = false;
  // State field(s) for ItenHover widget.
  bool itenHoverHovered12 = false;
  // State field(s) for LogOut widget.
  bool logOutHovered = false;
  // State field(s) for LightMode widget.
  bool lightModeHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future expand(BuildContext context) async {
    menuSize = 200.0;
  }

  Future retract(BuildContext context) async {
    menuSize = valueOrDefault<double>(
      logoSize + ((paddingLayout + paddingItem) * 2) - (paddingItem),
      74.0,
    );
  }
}
