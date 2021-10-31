#include <iostream>
#include <limits>
#include <vector>
using namespace std;

extern "C" signed long input_array(signed long* ptr, signed long size){
	signed long input = 0;
	signed long count = 0;
	
	//step 3
	cout << "Input your integer data one line at a time and enter 'q' when finished.\n";
	
	while(true){
		cout << "Enter the next integer: ";
		cin >> input;
		if(cin.fail()){
			cout << "You entered nonsense! Assuming you are done.";
			return count;
			}
		else if(input){
			//append the user input to the array
			return 0;
			}
		*(ptr+count) = input;
		count++;
	}

}
