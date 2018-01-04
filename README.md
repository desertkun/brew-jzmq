# homebrew-jzmq
Homebrew keg for [jzmq](https://github.com/zeromq/jzmq). Forked from [robinbb/brew-jzmq](https://github.com/robinbb/brew-jzmq) and fixed.

# Install
```
brew tap desertkun/jzmq
brew install jzmq
```

# Use
Define `JAVA_LIBRARY_PATH=/usr/local/lib` environment variable for your app so it would know where to load the dylibs.
