When you add the JavaScript file, Xcode detects that the file is a source code file, assumes you want to compile it and automatically adds it to the Compile Sources build phase.

To stop Xcode trying to compile it and make it copy the file instead, expand your target in the Groups and Files list, remove the JavaScript file from the Compile Sources build phase and add it to the Copy Bundle Resources build phase.
