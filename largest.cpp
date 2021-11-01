#include <stdio.h>
#include <iostream>
using namespace std;

extern "C" long manager();

int main(){
	
	//step 1
	cout << endl;
	cout << "Welcome to CPSC 240 Assignment 3 brought to you by Cesar Gutierrez." << endl;
	manager();
	cout << "The driver received this value: " <<endl;
	cout << "Have a nice day. The program will return control to the operating system." <<endl;
	return 0;
}


