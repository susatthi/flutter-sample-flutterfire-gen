FVM := $(shell which fvm)
FLUTTER := $(FVM) flutter

.PHONY: pub-get
pub-get:
	$(FLUTTER) pub get

.PHONY: pub-upgrade
pub-upgrade:
	$(FLUTTER) pub upgrade

.PHONY: clean
clean:
	$(FLUTTER) clean

.PHONY: analyze
analyze:
	$(FLUTTER) analyze
	$(FVM) dart run custom_lint

.PHONY: format
format:
	$(FLUTTER) format lib/

.PHONY: format-dry-exit-if-changed
format-dry-exit-if-changed:
	$(FLUTTER) format --dry-run --set-exit-if-changed lib/

.PHONY: build-runner-build
build-runner-build:
	$(FLUTTER) packages pub run build_runner build --delete-conflicting-outputs

.PHONY: build-runner-watch
build-runner-watch:
	$(FLUTTER) packages pub run build_runner clean
	$(FLUTTER) packages pub run build_runner watch --delete-conflicting-outputs

.PHONY: test
test:
	make analyze
	$(FLUTTER) test

.PHONY: flutter-native-splash
flutter-native-splash:
	$(FLUTTER) pub run flutter_native_splash:create

.PHONY: flutter-launcher-icons
flutter-launcher-icons:
	$(FLUTTER) pub run flutter_launcher_icons

### Android Relase Commands

.PHONY: build-android
build-android-dev:
	$(FLUTTER) build appbundle \
		--release

### iOS Relase Commands

.PHONY: build-ios
build-ios-dev:
	$(FLUTTER) build ipa \
		--release
