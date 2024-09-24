from queue import Queue, PriorityQueue

#BFS
def BFS(graph, start, end):
    visited = []
    frontier = Queue()

    #Them node start vao frontier va visited
    frontier.put(start)
    visited.append(start)

    #Start khong co node cha
    parent = dict()
    parent[start] = None

    path_found = False

    while True:
        if frontier.empty():
            raise Exception("No way Exception")
        current_node = frontier.get()
        # visited.append(current_node)

        #Kiem tra current node co la end hay khong
        if current_node == end:
            path_found = True
            break
        
        for node in graph[current_node]:
            if node not in visited:
                frontier.put(node)
                parent[node] = current_node
                visited.append(node)

    #Xay dung duong di
    path = []
    if path_found:
        path.append(end)
        while parent[end] is not None:
            path.append(parent[end])
            end = parent[end]
        path.reverse()
    return path

#DFS
def DFS(graph, start, end):
    visited = []
    frontier = []

    #Them node start vao frontier va visited
    frontier.append(start)
    visited.append(start)

    #Start khong co node cha
    parent = dict()
    parent[start] = None

    path_found = False

    while True:
        if frontier == []:
            raise Exception("No way Exception")
        current_node = frontier.pop()
        # visited.append(current_node)

        #Kiem tra current node co la end hay khong
        if current_node == end:
            path_found = True
            break
        
        for node in graph[current_node]:
            if node not in visited:
                frontier.append(node)
                parent[node] = current_node
                visited.append(node)

    #Xay dung duong di
    path = []
    if path_found:
        path.append(end)
        while parent[end] is not None:
            path.append(parent[end])
            end = parent[end]
        path.reverse()
    return path

#UCS
def UCS(graph, start, end):
    visited = []
    frontier = PriorityQueue()

    #Them node start vao frontier va visited
    frontier.put((0,start))
    visited.append(start)

    #Start khong co node cha
    parent = dict()
    parent[start] = None

    path_found = False

    while True:
        if frontier.empty():
            raise Exception("No way Exception")
        current_w,current_node = frontier.get()
        visited.append(current_node)

        #Kiem tra current node co la end hay khong
        if current_node == end:
            path_found = True
            break
        
        for nodei in graph[current_node]:
            node,weight = nodei
            if node not in visited:
                frontier.put((current_w+weight,node))
                parent[node] = current_node
                visited.append(node)

    #Xay dung duong di
    path = []
    if path_found:
        path.append(end)
        while parent[end] is not None:
            path.append(parent[end])
            end = parent[end]
        path.reverse()

    return current_w, path