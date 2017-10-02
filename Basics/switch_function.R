# switch function:

# switch(statement, list)

# if the statement is a number, it returns the element in this position

switch(2, "red", "black", "green", "blue", "brown")
switch(1, "red", "black", "green", "blue", "brown")

    # if it's out of range or in smaller than 1 it returns NULL

switch(0, "red", "black", "green", "blue", "brown")
switch(16, "red", "black", "green", "blue", "brown")

# the resoult can be also a string, the maching named item's value it's returned

switch("color","color" = "red", "shape" = "square", "length" = "5")
switch("shape","color" = "red", "shape" = "square", "length" = "5")


