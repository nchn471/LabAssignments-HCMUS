from collections import defaultdict

#read data
def read_txt(file):
    size = int(file.readline())
    start, goal = [int(num) for num in file.readline().split(' ')]
    matrix = [[int(num) for num in line.split(' ')] for line in file]
    return size,start,goal,matrix
#chuyen adj matrix -> adj list
def convert_graph(a):
    adjList = defaultdict(list)
    for i in range(len(a)):
        # adjList[i] 
        for j in range(len(a[i])):
            if a[i][j] == 1:
                adjList[i].append(j)
    return adjList
def convert_graph_weight(a):
    adjList = defaultdict(list)
    for i in range(len(a)):
        for j in range(len(a[i])):
            if a[i][j] !=0:
                adjList[i].append((j,(a[i][j])))
    return adjList