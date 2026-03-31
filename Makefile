#
# Prereq
#   brew install sdl2 sdl2_mixer sdl_net
# then make
#
CPP      = c++
CC       = gcc
OBJ      = graf.o r3.o
LINKOBJ  = graf.o r3.o

# SDL設定（自動取得）
#SDL_CFLAGS := $(shell sdl2-config --cflags)
SDL_CFLAGS := -I/opt/homebrew/include/ -D_THREAD_SAFE
SDL_LIBS   := $(shell sdl2-config --libs)
LIBS     = $(SDL_LIBS) -lSDL2_mixer -lSDL2_net
BIN      = r3mac
CXXFLAGS = $(SDL_CFLAGS) -Os -fpermissive
CFLAGS   = -Os

RM       = rm -f

.PHONY: all clean

all: $(BIN)

clean:
	$(RM) $(OBJ) $(BIN)

$(BIN): $(OBJ)
	$(CPP) $(LINKOBJ) -o $(BIN) $(LIBS)

graf.o: graf.cpp
	$(CPP) -c graf.cpp -o graf.o $(CXXFLAGS)

r3.o: r3.cpp
	$(CPP) -c r3.cpp -o r3.o $(CXXFLAGS)
