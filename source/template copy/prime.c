volatile unsigned int* LED = (unsigned int*)0x2000;

// Checks if x is prime
int isprime(int x) {
    if (x < 2)
        return 0;
    if (x == 2)
        return 1;

    for (int div = 2; div*div <= x; div++)
        if (x % div == 0)
            return 0;

    return 1;
}

// Returns the n-th prime number
int prime(int n) {
    int counter = 1;
    int found = 0;

    while (found < n) {
        counter++;
        if (isprime(counter))
            found++;
    }

    return counter;
}

int main(void) {
    *LED = 0x00;
    int p = prime(10);
    *LED = 0xff;
	return 0;
}
