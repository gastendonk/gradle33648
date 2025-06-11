cls

if exist build\david rd /s /q build\david

if exist build\goliath rd /s /q build\goliath

gradlew.bat --console=plain -Pbau=1 clean david goliath
