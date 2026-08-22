#include <iostream>
#include <vector>

class FIR {
private:
	std::vector<double> h;
	std::vector<double> x;
	size_t num_taps;

public:
	FIR(const std::vector<double>& coeffs) : h(coeffs), x(coeffs.size(), 0.0), num_taps(coeffs.size()) {}


	double process(double in_sample){
		for (int i = 0; i<num_taps; i++){
			
		return 0;
	}


};

int main(int argc, char* argv[]){

	std::vector<double> matlab_coeffs; //insert from tx file


	return 0;
}
