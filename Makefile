project/init:
	flutter clean ; flutter pub get ; flutter pub run build_runner build --delete-conflicting-outputs 

project/build/runner:
	flutter pub run build_runner build --delete-conflicting-outputs

git/pre-commit:
	fvm flutter pub run import_sorter:main bin lib test && fvm dart fix --apply && fvm flutter analyze