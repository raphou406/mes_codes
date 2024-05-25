import time
startTime = time.time()

T=(i for i in range(100))
for i in T:
    print(next(T))
print(time.time()-startTime)

startTime2 = time.time()

T=[]
for i in range(100):
    T.append(i)
print(T)
print(time.time()-startTime2)

tab1 = [[None for i in range(3)] for i in range(5)]
for i in range(len(tab1)):
    for j in range(len(tab1[i])):
        tab1[i][j] = i + j
print(tab1)
