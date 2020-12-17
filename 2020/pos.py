print('WELCOME TO MS SUPERMALL! ')
print()
print()
print('HOW MAY I HELP YOU?')
print()
print('1. Potato ------------50',
      '\n2. Apple -------------35',
      '\n3. Orange ------------40',
      '\n4. Banana ------------25',
      '\n5. Popcorn ----------120',
      '\n6. Bottled Water -----20',
      '\n7. Cola --------------45',
      '\n\n8. Check Out','\n9. Exit ')
print()

i = 1
while i <= 9:

    s = int(input('Select Item:\n'))

    if ( s == 1):
            q = int(input('Enter Quantity:\n'))
            p = q*50 #potato

    elif( s == 2):
            q = int(input('Enter Quantity:\n'))
            a = q*35 #apple

    elif( s == 3):
            q = int(input('Enter Quantity:\n'))
            o = q*35 #orange

    elif( s == 4):
            q = int(input('Enter Quantity:\n'))
            b = q*35 #banana
            
    elif( s == 5):
            q = int(input('Enter Quantity:\n'))
            pn = q*35 #popcorn
            
    elif( s == 6):
            q = int(input('Enter Quantity:\n'))
            w = q*35 #bottled water
            
    elif( s == 7):
            q = int(input('Enter Quantity:\n'))
            c = q*35 #cola
            
    elif( s == 8): #check out
            t = p + a + o + b + pn + w + c
            print('Your total is ', t)
        
            #d = str(input('Special Discount? Y or N?'))
            
    elif( s == 9):
            quit()
            
    else :
     print('Invalid Option!')