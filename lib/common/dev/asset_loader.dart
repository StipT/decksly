// Asset subfolders
const String SUBFOLDER_BACKGROUND = 'background';
const String SUBFOLDER_BUTTON = 'button';
const String SUBFOLDER_CLASS = 'class';
const String SUBFOLDER_DROPDOWN = 'dropdown';
const String SUBFOLDER_FONT = 'font';
const String SUBFOLDER_LOCALIZATION = 'localization';
const String SUBFOLDER_MISC = 'misc';
const String SUBFOLDER_SET = 'set';
const String SUBFOLDER_TEXT_FIELD = 'text_field';
const String SUBFOLDER_SHARED = 'shared';
const String NO_ASSET = '';

// Extensions
const String PNG_EXTENSION = 'png';
const String SVG_EXTENSION = 'svg';
const String JPG_EXTENSION = 'jpg';

String assetPath(String subFolder, String assetName, {String fileExtension = PNG_EXTENSION}) =>
    'assets/$subFolder/$assetName.$fileExtension';
