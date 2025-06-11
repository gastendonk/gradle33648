# Demo projects for Gradle issue 33648

## Please do not make projects without a folder an error!

**See also Gradle issue 25531**

We have a use case for projects without folders. We have so-called pseudo-app projects. These projects don't correspond to any existing
directory and are created in RAM by the build process.We create custom apps from a selection of real projects. Pseudo-app project represent
dynamically created configuration for every customer and environment, which gives us a freedom to configure deliverables "on the fly".

The pseudo-app projects have folders in the build folder, e.g., umbrella-project/build/{customer-name}/production/r3 (where "r3" is a
real Java project and also the application name). If this ticket forced us to run mkdirs(), we would end up with tons of empty folders
in the build folder (for all customers, all environments, and all apps).

**We therefore strongly advocate an option to allow projects without existing directory!**

### Gradle version
We initially wanted to move to Gradle 8.14, but have now moved to 8.10 as an interim step.

### Gradle version that used to work
8.4

# How to reproduce using this Github repository

1. Clone repo into Eclipse (Windows)
2. `cd umbrella`
3. `build.bat`

Main content of build.bat is `gradlew -Pbau=1 clean david goliath`.
In real world scenarios we would call something like `gradlew -Pbau=1 clean david_test_app1` and expect that there is no umbrella/build/goliath folder and no umbrella/build/david/production folder.

*What is the Gradle command-line option `-Pbau=1` for? It allows us to distinguish between build and IDE mode (bau=0). Certain Gradle actions should not be executed in Eclipse (in all Gradle phases). We haven't found an elegant solution for this.*

## actual behaviour
several warnings
```
Configuring project ':david_test_app1' without an existing directory is deprecated. The configured projectDirectory 'C:\projects\git-repos-2203\gradle33648\umbrella\build\david\test\app1' does not exist, can't be written to or is not a directory. This behavior has been d
eprecated. This will fail with an error in Gradle 9.0. Make sure the project directory exists and can be written. Consult the upgrading guide for further information: https://docs.gradle.org/8.10/userguide/upgrading_version_8.html#deprecated_missing_project_directory    
Configuring project ':david_test_app2' without an existing directory is deprecated. The configured projectDirectory 'C:\projects\git-repos-2203\gradle33648\umbrella\build\david\test\app2' does not exist, can't be written to or is not a directory. This behavior has been d
eprecated. This will fail with an error in Gradle 9.0. Make sure the project directory exists and can be written. Consult the upgrading guide for further information: https://docs.gradle.org/8.10/userguide/upgrading_version_8.html#deprecated_missing_project_directory    
Configuring project ':goliath_production_app2' without an existing directory is deprecated. The configured projectDirectory 'C:\projects\git-repos-2203\gradle33648\umbrella\build\goliath\production\app2' does not exist, can't be written to or is not a directory. This beh
avior has been deprecated. This will fail with an error in Gradle 9.0. Make sure the project directory exists and can be written. Consult the upgrading guide for further information: https://docs.gradle.org/8.10/userguide/upgrading_version_8.html#deprecated_missing_proje
ct_directory
Configuring project ':goliath_test_app1' without an existing directory is deprecated. The configured projectDirectory 'C:\projects\git-repos-2203\gradle33648\umbrella\build\goliath\test\app1' does not exist, can't be written to or is not a directory. This behavior has be
en deprecated. This will fail with an error in Gradle 9.0. Make sure the project directory exists and can be written. Consult the upgrading guide for further information: https://docs.gradle.org/8.10/userguide/upgrading_version_8.html#deprecated_missing_project_directory
Configuring project ':goliath_test_app2' without an existing directory is deprecated. The configured projectDirectory 'C:\projects\git-repos-2203\gradle33648\umbrella\build\goliath\test\app2' does not exist, can't be written to or is not a directory. This behavior has be
en deprecated. This will fail with an error in Gradle 9.0. Make sure the project directory exists and can be written. Consult the upgrading guide for further information: https://docs.gradle.org/8.10/userguide/upgrading_version_8.html#deprecated_missing_project_directory
Configuring project ':goliath_production_app1' without an existing directory is deprecated. The configured projectDirectory 'C:\projects\git-repos-2203\gradle33648\umbrella\build\goliath\production\app1' does not exist, can't be written to or is not a directory. This beh
avior has been deprecated. This will fail with an error in Gradle 9.0. Make sure the project directory exists and can be written. Consult the upgrading guide for further information: https://docs.gradle.org/8.10/userguide/upgrading_version_8.html#deprecated_missing_proje
ct_directory
Configuring project ':david_production_app1' without an existing directory is deprecated. The configured projectDirectory 'C:\projects\git-repos-2203\gradle33648\umbrella\build\david\production\app1' does not exist, can't be written to or is not a directory. This behavio
r has been deprecated. This will fail with an error in Gradle 9.0. Make sure the project directory exists and can be written. Consult the upgrading guide for further information: https://docs.gradle.org/8.10/userguide/upgrading_version_8.html#deprecated_missing_project_d
irectory
Configuring project ':david_production_app2' without an existing directory is deprecated. The configured projectDirectory 'C:\projects\git-repos-2203\gradle33648\umbrella\build\david\production\app2' does not exist, can't be written to or is not a directory. This behavio
r has been deprecated. This will fail with an error in Gradle 9.0. Make sure the project directory exists and can be written. Consult the upgrading guide for further information: https://docs.gradle.org/8.10/userguide/upgrading_version_8.html#deprecated_missing_project_d
irectory
```

## wanted behaviour
no messages (no error in Gradle 9)
