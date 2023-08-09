def countdown(number):
    for i in range(number, 0, -1):
        if i % 5 == 0 and i % 3 == 0:
            print(f"{i} - Testing")
        elif i % 5 == 0:
            print(f"{i} - Agile")
        elif i % 3 == 0:
            print(f"{i} - Software")
        else:
            print(i)


if __name__ == "__main__":
    number = input("Enter your integer please: ")
    countdown(int(number))
