#include <stdio.h>
#include <iostream>
using namespace std;

extern "C" long manager();

int main(){
	
	//step 1
	cout << endl;
	cout << "Welcome to CPSC 240 Assignment 3 brought to you by Cesar Gutierrez." << endl;
	manager();
	cout << "We are now back in largest.cpp" <<endl;
	return 0;
}


