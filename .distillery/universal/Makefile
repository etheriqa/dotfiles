TARGET   = solution
CXXFLAGS = -Wall -std=c++11 -O3 -include g++.h -include clang++.h

.PHONY: test copy-g++ copy-clang++

test: $(TARGET)
	distillery test $(TARGET)

copy-g++:
	cat g++.h solution.cc | pbcopy

copy-clang++:
	cat clang++.h solution.cc | pbcopy
