#include <iostream>
#include <vector>

class FIR {
private:
	std::vector<double> b;
	size_t num_taps;

public:
	FIR(const std::vector<double>& coeffs) : b(coeffs), num_taps(coeffs.size()) {}

	double process(double in_sample){

		return 0;
	}


}

int main(int argc, char* argv[]){




	return 0;
}
