I use a composite pattern for this project. 
If you want to test the project, you could add which class you want to composite. After adding, you use composite.execute() method, all exercise which you want to test will execute.

Example: 

```
final composite = Composite(); 
composite.add(Divisor(number: 4));
composite.add(DrawSquare(squareSize: 3));
composite.execute();
```

```
#0: 
[1, 2, 4]

#1:
 --- --- ---
|   |   |   |
 --- --- ---
|   |   |   |
 --- --- ---
|   |   |   |
 --- --- ---
 ```


Easy to read, easy to test.
Have a nice day.
Matthew.
