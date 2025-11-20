import random

# create a list of names
names = ['Alice', 'Bob', 'Charlie', 'David']

# write a function to print each name
def print_names(name_list):
    for name in name_list:
        print(name)
# modify the function by randomly selecting a name to print with a greeting

def print_random_name(name_list):
    name = random.choice(name_list)
    print(f"Hello, {name}!")

# For demo purposes, uncomment the lines below to run the functions:
# print_names(names)
# print_random_name(names)                
