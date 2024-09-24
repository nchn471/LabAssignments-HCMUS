from load_data import *
from search_algorithms import *

def main():

    file_1 = open("Input.txt","r")
    file_2 = open("InputUCS.txt","r")

    size_1, start_1, goal_1, matrix_1 = read_txt(file_1)
    size_2, start_2, goal_2, matrix_2 = read_txt(file_2)

    file_1.close()
    file_2.close()

    graph_1 = convert_graph(matrix_1)
    graph_2 = convert_graph_weight(matrix_2)

    result_bfs = BFS(graph_1, start_1, goal_1)
    print("Kết quả sử dụng thuật toán BFS: \n", result_bfs)

    result_dfs = DFS(graph_1, start_1, goal_1)
    print("Kết quả sử dụng thuật toán DFS: \n", result_dfs)

    cost, result_ucs = UCS(graph_2, start_2, goal_2)
    print("Kết quả sử dụng thuật toán UCS: \n", result_ucs, "với tổng chi phí là", cost)

if __name__ == "__main__":
    main()