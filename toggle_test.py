def toggle_test(lines):
    print("Can you see the indent lines?")
    for line in lines:
        if line == "visible":
            print("Hurray!")
            print("I can see them")
        else:
            print("Uh-oh")
            print("I can't!")
