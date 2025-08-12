project/init:
	flutter clean ; flutter pub get ; flutter pub run build_runner build --delete-conflicting-outputs 

project/build/runner:
	flutter pub run build_runner build --delete-conflicting-outputs

project/build/apk/dev:
	cp .env.dev .env ; flutter build apk --flavor developer -t lib/main_developer.dart --release

project/build/apk/prod:
	cp .env.prod .env ; flutter build apk --flavor production -t lib/main_production.dart --release

project/build/ipa/dev:
	cp .env.dev .env ; flutter build ipa --flavor developer -t lib/main_developer.dart --release

project/build/ipa/prod:
	cp .env.prod .env ; flutter build ipa --flavor production -t lib/main_production.dart --release

git/pre-commit:
	flutter pub run import_sorter:main bin lib test && dart fix --apply && flutter analyze

project/test:
	flutter test --coverage; genhtml coverage/lcov.info -o coverage/html; open coverage/html/index.html;