Demo projects for Gradle issue 33648

# Please do not make projects without a folder an error!

**See also Gradle issue 25531**

We have a use case for projects without folders. We have so-called pseudo-app projects. These projects don't correspond to any existing
directory and are created in RAM by the build process.We create custom apps from a selection of real projects. Pseudo-app project represent
dynamically created configuration for every customer and environment, which gives us a freedom to configure deliverables "on the fly".

The pseudo-app projects have folders in the build folder, e.g., umbrella-project/build/{customer-name}/production/r3 (where "r3" is a
real Java project and also the application name). If this ticket forced us to run mkdirs(), we would end up with tons of empty folders
in the build folder (for all customers, all environments, and all apps).

**We therefore strongly advocate an option to allow projects without existing directory!**

## Gradle version
We initially wanted to move to Gradle 8.14, but have now moved to 8.10 as an interim step.

## Gradle version that used to work
8.4
