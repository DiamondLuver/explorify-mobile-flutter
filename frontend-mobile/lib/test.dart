void main() {
  int a = add(10, 20);
  hello("Sok");
}

int sum(int a, int b){
  return a + b;
}

int add(int a, int b) => a + b;

// int multi(int a, int b) => {a + b}; //Error

void hello(String name) => print("hello $name");
