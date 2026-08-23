#include <iostream>
#include <string>
#include <vector>
#include <fstream>

class FIR {
private:
	std::vector<double> h;
	std::vector<double> x;
	int index;
	size_t num_taps;

public:
	FIR(const std::vector<double>& coeffs) : h(coeffs), x(coeffs.size(), 0.0), index(0), num_taps(coeffs.size()) {}
	

	double process(double in_sample){
		x[index]=in_sample;
		double y_sum = 0.0;

		for (size_t k = 0; k<num_taps; k++){
			y_sum += h[k]*x[num_taps-k];
		}
		index++;
		if (index==num_taps) index=0;
			
		return y_sum;
	}


};

int main(int argc, char* argv[]){
	
	std::vector<double> matlab_coeffs; //insert from tx file
	std::vector<double> test_inputs = {1.0, 0.0, 0.0, 0.0};

	std::ifstream file("coeffs.txt");
	std::string line;
	while(getline(file, line)){
		matlab_coeffs.push_back(std::stod(line));
	}

	
	FIR filter(matlab_coeffs);
	for (size_t i = 0; i<test_inputs.size(); i++){
		std::cout << "y[" << i << "]: " << filter.process(test_inputs[i]) << "\n";
	} 	

	return 0;
}
