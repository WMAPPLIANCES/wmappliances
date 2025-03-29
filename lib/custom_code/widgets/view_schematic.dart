// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart';
// It's good practice to also import canLaunchUrl for checks
import 'package:url_launcher/url_launcher_string.dart';

class ViewSchematic extends StatefulWidget {
  const ViewSchematic({
    super.key,
    this.width,
    this.height = 500, // Default height if none provided
    required this.urlData,
  });

  final double? width;
  final double? height; // Height is now required for the scrollable area
  final List<dynamic> urlData; // Expects List<Map<String, String>> essentially

  @override
  State<ViewSchematic> createState() => _ViewSchematicState();
}

class _ViewSchematicState extends State<ViewSchematic> {
  // Helper function to show error messages consistently
  void _showErrorSnackbar(String message) {
    // Check if the widget is still mounted before showing Snackbar
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor:
            FlutterFlowTheme.of(context).error, // Use theme error color
      ),
    );
  }

  // Helper function to launch URLs safely
  Future<void> _launchLink(String? urlString) async {
    if (urlString == null || urlString.isEmpty) {
      print('URL is null or empty.');
      _showErrorSnackbar('No link available for this item.');
      return;
    }

    // Try parsing the URL
    final Uri? uri = Uri.tryParse(urlString);
    if (uri == null || !uri.isAbsolute) {
      print('Invalid URL format: $urlString');
      _showErrorSnackbar('Invalid link format provided.');
      return;
    }

    print('Attempting to launch URL: $uri');
    try {
      // Check if the URL can be launched before attempting
      if (await canLaunchUrlString(urlString)) {
        // Launch in external app/browser is usually preferred
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        print('URL launched successfully: $uri');
      } else {
        print('Could not determine if URL can be launched: $uri');
        _showErrorSnackbar('Cannot open this type of link.');
      }
    } catch (e) {
      print('Could not launch URL: $e');
      _showErrorSnackbar('Error opening link: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use the provided theme
    final theme = FlutterFlowTheme.of(context);

    // Handle the case where the list is empty
    if (widget.urlData.isEmpty) {
      return Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.secondaryBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: theme.alternate,
            width: 1,
          ),
        ),
        child: Text(
          'No schematics available.',
          style: theme.bodyMedium.copyWith(color: theme.secondaryText),
        ),
      );
    }

    // Main container defining the bounds and appearance
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          // Subtle background gradient for a modern feel
          gradient: LinearGradient(
            colors: [
              theme.primaryBackground,
              theme.secondaryBackground, // Blend background colors
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16), // More rounded corners
          boxShadow: [
            // Soft shadow for depth
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
          border: Border.all(
            // Optional subtle border
            color: theme.primary.withOpacity(0.2),
            width: 1,
          )),
      child: ClipRRect(
        // Clip the list view to the rounded corners
        borderRadius: BorderRadius.circular(16),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0, horizontal: 8.0), // Padding inside the scroll area
          itemCount: widget.urlData.length,
          itemBuilder: (context, index) {
            final item = widget.urlData[index];
            // Safely extract title and URL, providing defaults
            final title = item is Map && item.containsKey('title')
                ? item['title'] as String? ?? 'View Schematic'
                : 'View Schematic';
            final urlString = item is Map && item.containsKey('url')
                ? item['url'] as String?
                : null;

            // Build each list item
            return Card(
              elevation: 0, // Use container shadow instead
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color: theme.secondaryBackground
                  .withOpacity(0.8), // Slightly transparent card background
              clipBehavior:
                  Clip.antiAlias, // Ensures InkWell respects border radius
              child: InkWell(
                onTap: () => _launchLink(urlString),
                splashColor: theme.primary.withOpacity(0.1),
                highlightColor: theme.primary.withOpacity(0.05),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 14.0),
                  child: Row(
                    children: [
                      // Icon for visual cue
                      Icon(
                        Icons.link_rounded, // Use a rounded icon
                        color: theme.primary,
                        size: 22.0,
                      ),
                      const SizedBox(width: 14.0),
                      // Title text - flexible to take available space
                      Expanded(
                        child: Text(
                          title,
                          style: theme.bodyLarge.copyWith(
                            fontWeight: FontWeight.w600, // Slightly bolder text
                            color: theme.primaryText,
                          ),
                          maxLines: 2, // Prevent excessively long titles
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      // Chevron icon indicating action/navigation
                      Icon(
                        Icons.chevron_right_rounded,
                        color: theme.secondaryText,
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
