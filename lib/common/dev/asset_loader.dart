// Asset subfolders
const String kSubfolderBackground = "background";
const String kSubfolderButton = "button";
const String kSubfolderClass = "class";
const String kSubfolderDropdown = "dropdown";
const String kSubfolderFont = "font";
const String kSubfolderLocalization = "localization";
const String kSubfolderMisc = "misc";
const String kSubfolderSet = "set";
const String kSubfolderTextField = "text_field";
const String kSubfolderShared = "shared";
const String kNoAsset = "";

// Extensions
const String kPNGExtension = "png";
const String kSVGExtension = "svg";
const String kJPGExtension = "jpg";

String assetPath(String subFolder, String assetName, {String fileExtension = kPNGExtension}) =>
    "assets/$subFolder/$assetName.$fileExtension";
