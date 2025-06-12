SDKDIR="$(xcrun --sdk macosx --show-sdk-path)" \
CPPFLAGS="-I$(brew --prefix gdbm)/include -I$(brew --prefix xz)/include \
          -I$(brew --prefix zlib)/include -I$(brew --prefix ncurses)/include \
          -I$(brew --prefix readline)/include" \
LDFLAGS="-L$(brew --prefix gdbm)/lib -L$(brew --prefix xz)/lib \
         -L$(brew --prefix zlib)/lib -L$(brew --prefix ncurses)/lib \
         -L$(brew --prefix readline)/lib" \
./configure --with-pydebug \
            --with-openssl="$(brew --prefix openssl@3)" \
            --with-tcltk-libs="$(pkg-config --libs tcl tk)" \
            --with-tcltk-includes="$(pkg-config --cflags tcl tk)" \
            --with-dbmliborder=gdbm:ndbm \
            --with-ensurepip=upgrade \
            --enable-shared \
            --enable-universalsdk="$(xcrun --sdk macosx --show-sdk-path)" \
            --with-universal-archs=intel-64 \
            --with-suffix=""

make
make install
