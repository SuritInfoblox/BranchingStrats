def greet(name):
    """A function that greets the user."""
    print(f"Hello, {name}!")


def say_goodbye(name):
    """A function that says goodbye to the user."""
    print(f"Goodbye, {name}!")

# Main program
user_name = input("Enter your name: ")
greet(user_name)

# Call the say_goodbye function
say_goodbye(user_name)


