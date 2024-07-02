from collections import deque

def bfs(maze):
    jml_baris, jml_kolom = len(maze), len(maze[0])
    
    titik_mulai = (0, jml_baris - 1)
    titik_akhir = (jml_kolom - 1, 0)

    arah_gerakan = [(0, 1), (1, 0), (0, -1), (-1, 0)]

    antri = deque([(titik_mulai, [titik_mulai])])

    sudah_dikunjungi = set()
    sudah_dikunjungi.add(titik_mulai)
    
    while antri:
        (kolom_now, line_now), jalur = antri.popleft()        
        
        if (kolom_now, line_now) == titik_akhir:
            print("Jarak Minimum:", len(jalur) - 1)
            print("Jalur:", jalur)
            return

        for change_kolom, change_baris in arah_gerakan:
            kolom_baru, baris_baru = kolom_now + change_kolom, line_now + change_baris

            if 0 <= kolom_baru < jml_kolom and 0 <= baris_baru < jml_baris and maze[baris_baru][kolom_baru] == ' ' and (kolom_baru, baris_baru) not in sudah_dikunjungi:
                sudah_dikunjungi.add((kolom_baru, baris_baru))
                antri.append(((kolom_baru, baris_baru), jalur + [(kolom_baru, baris_baru)]))
    
    print("Jalur tidak ditemukan")
    return

maze = [
    [' ', ' ', ' ', '#', ' '],
    [' ', '#', ' ', '#', ' '],
    [' ', '#', ' ', '#', ' '],
    [' ', '#', ' ', '#', ' '],
    [' ', '#', ' ', '#', ' '],
    [' ', ' ', ' ', '#', ' '],
    [' ', '#', ' ', '#', ' '],
    [' ', '#', ' ', ' ', ' '],
    [' ', '#', '#', ' ', ' '],
    [' ', '#', '#', '#', '#']
]

bfs(maze)
