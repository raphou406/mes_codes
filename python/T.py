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