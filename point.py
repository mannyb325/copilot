#create a list of names
names = ["Alice", "Bob", "Charlie"]

#write a function that will print each name
def print_names(name_list):
    for name in name_list:
        print(name)

print_names(names)

#modify the function by randomly selecting a name and print a greeting.
import random

def print_random_greeting(name_list):
    name = random.choice(name_list)
    print(f"Hello, {name}!")

print_random_greeting(names)        
