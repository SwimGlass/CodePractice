#include <iostream>
#include <thread>

using namespace std;

void foo() {
    std::cout << "foo" << endl;
}

void bar(int x) {
    for (int i = 0; i < 10; i++) {
        x++;
        std::cout << "bar x=" << x << endl;
    }
}

int main(void) {
    std::thread t1(foo);
    std::thread t2(bar, 123);
    std::cout << "main, foo and bar now execute concurrently..." << endl; // synchronize threads
    
    std::cout << "sleep 1s\n";
    std::this_thread::sleep_for(std::chrono::seconds(1));
    
    std::cout << "join t1\n";
    t1.join(); 
    std::cout << "join t2\n";
    t2.join();  
    
    std::cout << "foo and bar completed.\n";
    return 0;
}
