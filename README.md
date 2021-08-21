# Reset Android Studio

When Android Studio is upgraded, projects often fail to build for mysterious reasons. This script 
can clear everything at one go, so you can start with a clean slate & minimize wasted time.

## How to use

1. Download and place this script somewhere on your local machine.
2. From the root of your Android Studio project, run it: `reset-android-studio-mac.sh`

## Frequently Asked Questions

### Is there a Linux or Windows equivalent?

Not yet, since I primarily develop on macOS. Please feel free to contribute alternate versions.

### Is there a way to do a dry run?

For the sake of simplicity, there is currently no option to do a dry run. If you know you need this,
just go ahead and run it.

I assume you have all your important source code under version control anyway, so if this deletes
something you wish it did not delete, you should be able to revert it from your source control.

### Are there any other options?

No, because when things go wrong, it’s usually best to clear everything and re-build. This way, you
spend less time, and you don’t need to worry about the right set of flags or config knobs you need
to twiddle.
