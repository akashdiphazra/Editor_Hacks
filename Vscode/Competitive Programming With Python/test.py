import Fast_Input.fast_input as FI
import time

def main():
    n, m = FI.mi()
    a = [0] * n
    p = []
    for i in range(m):
        l = FI.li()
        a[l.index(max(l))] += 1
    print(a.index(max(a)) + 1)


if __name__ == "__main__":
    start = time.process_time()
    FI.read()
    main()
    end = time.process_time()
    print(f"\nTime Taken: {0:.2f} ".format(time_taken=end - start))
