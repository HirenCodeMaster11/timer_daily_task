# time_daily_task

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

<h1 align="center">👉 Timer Daily Task 👈</h1>

<h2 align="center">1. Buttons </h2>

<h1 align="left"></h1>
<div align="center">
  <img height="550"  src="https://github.com/HirenCodeMaster11/timer_daily_task/assets/148859956/28ee891d-22f7-4c78-a6d3-c546a08c65b3" />
</div>
<div align="center">
<a href="https://github.com/HirenCodeMaster11/timer_daily_task/blob/master/lib/Buttons/button.dart">-> 📂 Go To Dart File 📂 <-</a>
</div>

<h2 align="center">2. Asynchronous Programming </h2>

### ⚫  Asynchronous Programming :

- ```Asynchronous functions return a Future to signify that their result is not immediately available.``` 
- Process is not depend on another process.

### ⚫  Future Class :

- ```Future represents a future result of an asynchronous computation. this result will eventually appear in the Future after the processing is complete.```

### ⚫  Duration class & Future.delayed() constructor :

- ```delayed Flutter is a constructor that creates a future which runs its computation after a delay.```
- Duration object which specifies the delay before the callback function is executed, and the second argument is the callback function.

### ⚫  Duration class & Future.delayed() constructor example:

```
  void main()async{
  
  print('Hiren');
  
  await Future.delayed(Duration(seconds: 2),
  
  () {
  
    print('hello dart');
  
  },
  
 );
 
  Future(() => print('hello world'));
  
  print('hello flutter');
  
}
```

### ⚫  Use of the async :

- ```You can use the async keyword before a function's body to mark it as asynchronous.```

### ⚫  Use of the await keyword :

- ```You can use the await keyword to get the completed result of an asynchronous expression. The await keyword only works within an async function.```

### ⚫  Recursion :

- ```Recursion in any programming language means a function making a call to itself.```

### ⚫  Recursion Example :

```
int Fib(int n){ 
  if(n<=1) //Base Condition 
    return n; 
  return Fib(n-1)+Fib(n-2); 
} 
  
  
void main() { 
  print(Fib(6)); 
}
```

### ⚫  Timer class  :

- ```A countdown timer that can be configured to fire once or repeatedly.```

### ⚫  Timer class Example :

```
void main() {
  Timer(const Duration(seconds: 5), handleTimeout);
}

void handleTimeout() {  // callback function
  // Do some work.
}
```

### ⚫  Timer.periodic :

- ```Periodic timers stay alive until they are manually canceled. Flutter has a different factory method, named periodic,to create such a timer.```

### ⚫  Timer.periodic Example :

```
var counter = 3;
Timer.periodic(const Duration(seconds: 2), (timer) {
  print(timer.tick);
  counter--;
  if (counter == 0) {
    print('Cancel timer');
    timer.cancel();
  }
});
```
