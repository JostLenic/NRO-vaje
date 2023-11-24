#include <iostream>
#include <cmath>

double f(double x) {
    return exp(3 * x) * atan(x / 2);
}

double trapezna_metoda(double a, double b, int n) {
    double h = (b - a) / n;
    double integral = 0.5 * (f(a) + f(b));

    for (int i = 1; i < n; ++i) {
        double x_i = a + i * h;
        integral += f(x_i);
    }

    return h * integral;
}

int main() {
    
    double a = 0.0;
    double b = 3.1 / 4.0;

    int n = 1000;

    double integral_value = trapezna_metoda(a, b, n);

    std::cout << "Priblizna vrednost integrala: " << integral_value << std::endl;

    return 0;
}
