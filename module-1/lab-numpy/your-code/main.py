#1. Import the NUMPY package under the name np.
import numpy as np


#2. Print the NUMPY version and the configuration.
print(np.version.version)

#3. Generate a 2x3x5 3-dimensional array with random values. Assign the array to variable "a"
# Challenge: there are at least three easy ways that use numpy to generate random arrays. How many ways can you find?

a = np.random.random((2,3,5))
print(a)

a = np.random.randint(0, 100, (2, 3, 5))
print(a)

a = np.random.normal(0, 100, (2, 3, 5))
print(a)

a = np.random.uniform(0, 100, (2, 3, 5))
print(a)

#4. Print a.

print(a)

#5. Create a 5x2x3 3-dimensional array with all values equaling 1.
#Assign the array to variable "b"

b = np.random.randint(1,2, size=(5,2,3))
b = np.ones((5, 2, 3))


#6. Print b.

print(b)

#7. Do a and b have the same size? How do you prove that in Python code?

np.shape(a) == np.shape(b)
#False


#8. Are you able to add a and b? Why or why not?

print(np.add(a,b))

"""
ValueError: operands could not be broadcast together with shapes (2,3,5) (5,2,3)
"""

#9. Transpose b so that it has the same structure of a (i.e. become a 2x3x5 array). Assign the transposed array to varialbe "c".

np.transpose(b,(1,2,0)).shape
c = np.transpose(b,(1,2,0))
"""
ValueError: operands could not be broadcast together with shapes (2,3,5) (3,2,5)
"""
#c = b.reshape(2,3,5)


#10. Try to add a and c. Now it should work. Assign the sum to varialbe "d". But why does it work now?

d = np.add(a,c)
np.shape(a) == np.shape(c)
# True

#11. Print a and d. Notice the difference and relation of the two array in terms of the values? Explain.

print(a)
print(d)

d == a+1

"""
array([[[ True,  True,  True,  True,  True],
        [ True,  True,  True,  True,  True],
        [ True,  True,  True,  True,  True]],

       [[ True,  True,  True,  True,  True],
        [ True,  True,  True,  True,  True],
        [ True,  True,  True,  True,  True]]])
"""
# each cell in a has been added by 1


#12. Multiply a and c. Assign the result to e.

e = np.multiply(a, c)

#13. Does e equal to a? Why or why not?

np.array_equal(a,e)

#True
# each cell in a has been multiplied by 1


#14. Identify the max, min, and mean values in d. Assign those values to variables "d_max", "d_min", and "d_mean"

d_min = np.min(d)
#-286.777873310378
d_max = np.max(d)
#132.37926911388345
d_mean = np.mean(d)
#2.2510047583581687


#15. Now we want to label the values in d. First create an empty array "f" with the same shape (i.e. 2x3x5) as d using `np.empty`.


#Return a new array of given shape and type, without initializing entries.
f = np.empty([2,3,5])


#16. Populate the values in f. For each value in d, if it's larger than d_min but smaller than d_mean, assign 25 to the corresponding value in f.
"""
If a value in d is larger than d_mean but smaller than d_max, assign 75 to the corresponding value in f.
If a value equals to d_mean, assign 50 to the corresponding value in f.
Assign 0 to the corresponding value(s) in f for d_min in d.
Assign 100 to the corresponding value(s) in f for d_max in d.
In the end, f should have only the following values: 0, 25, 50, 75, and 100.
Note: you don't have to use Numpy in this question.
"""

f[d == d_mean] = 50
f[d == d_min] = 0
f[d == d_max] = 100
f[(d > d_mean) & (d < d_max)] = 75
f[(d < d_mean) & (d > d_min)] = 25

            
print(d)
print(f)

"""
>>> d
array([[[ 104.98467874,   35.04172825,   73.92416907, -107.83538248,
         -286.77787331],
        [ -65.14776913,   71.5928389 ,  -34.8597842 ,   74.19824543,
           -2.63665328],
        [  59.89142186,  -76.96348082,   48.63366904,   84.38801151,
          132.37926911]],

       [[ -59.17085982,  -53.71638004,   61.96507929,   76.89321552,
         -117.59191823],
        [  93.93994331,   55.69520227,  -85.95923397,  123.34279135,
          -12.24303624],
        [ -49.48962083,  -43.47578026,   38.71361959,  -62.71064999,
           -9.47531789]]])
>>> f
array([[[ 75.,  75.,  75.,  25.,   0.],
        [ 25.,  75.,  25.,  75.,  25.],
        [ 75.,  25.,  75.,  75., 100.]],

       [[ 25.,  25.,  75.,  75.,  25.],
        [ 75.,  75.,  25.,  75.,  25.],
        [ 25.,  25.,  75.,  25.,  25.]]])
        
"""


#17. Print d and f. Do you have your expected f?
"""
For instance, if your d is:
array([[[1.85836099, 1.67064465, 1.62576044, 1.40243961, 1.88454931],
        [1.75354326, 1.69403643, 1.36729252, 1.61415071, 1.12104981],
        [1.72201435, 1.1862918 , 1.87078449, 1.7726778 , 1.88180042]],

       [[1.44747908, 1.31673383, 1.02000951, 1.52218947, 1.97066381],
        [1.79129243, 1.74983003, 1.96028037, 1.85166831, 1.65450881],
        [1.18068344, 1.9587381 , 1.00656599, 1.93402165, 1.73514584]]])

Your f should be:
array([[[ 75.,  75.,  75.,  25.,  75.],
        [ 75.,  75.,  25.,  25.,  25.],
        [ 75.,  25.,  75.,  75.,  75.]],

       [[ 25.,  25.,  25.,  25., 100.],
        [ 75.,  75.,  75.,  75.,  75.],
        [ 25.,  75.,   0.,  75.,  75.]]])
"""
print(d)
print(f)

"""
>>> d
array([[[ 104.98467874,   35.04172825,   73.92416907, -107.83538248,
         -286.77787331],
        [ -65.14776913,   71.5928389 ,  -34.8597842 ,   74.19824543,
           -2.63665328],
        [  59.89142186,  -76.96348082,   48.63366904,   84.38801151,
          132.37926911]],

       [[ -59.17085982,  -53.71638004,   61.96507929,   76.89321552,
         -117.59191823],
        [  93.93994331,   55.69520227,  -85.95923397,  123.34279135,
          -12.24303624],
        [ -49.48962083,  -43.47578026,   38.71361959,  -62.71064999,
           -9.47531789]]])
>>> f
array([[[ 75.,  75.,  75.,  25.,   0.],
        [ 25.,  75.,  25.,  75.,  25.],
        [ 75.,  25.,  75.,  75., 100.]],

       [[ 25.,  25.,  75.,  75.,  25.],
        [ 75.,  75.,  25.,  75.,  25.],
        [ 25.,  25.,  75.,  25.,  25.]]])       
"""



#18. Bonus question: instead of using numbers (i.e. 0, 25, 50, 75, and 100), how to use string values 
"""
("A", "B", "C", "D", and "E") to label the array elements? You are expecting the result to be:
array([[[ 'D',  'D',  'D',  'B',  'D'],
        [ 'D',  'D',  'B',  'B',  'B'],
        [ 'D',  'B',  'D',  'D',  'D']],

       [[ 'B',  'B',  'B',  'B',  'E'],
        [ 'D',  'D',  'D',  'D',  'D'],
        [ 'B',  'D',   'A',  'D', 'D']]])
Again, you don't need Numpy in this question.
"""
f = np.empty([2,3,5], dtype = np.unicode)

f[d == d_mean] = 'C'
f[d == d_min] = 'A'
f[d == d_max] = 'E'
f[(d > d_mean) & (d < d_max)] = 'D'
f[(d < d_mean) & (d > d_min)] = 'B'

"""
>>> f
array([[['D', 'D', 'D', 'B', 'A'],
        ['B', 'D', 'B', 'D', 'B'],
        ['D', 'B', 'D', 'D', 'E']],

       [['B', 'B', 'D', 'D', 'B'],
        ['D', 'D', 'B', 'D', 'B'],
        ['B', 'B', 'D', 'B', 'B']]], dtype='<U1')
"""







