from tkinter import *



root = Tk(screenName="Test", className='le plus gros test tkinter de ma vie omg')
frame = Frame(root)
frame.pack()

def change_color(color):
    frame.config(background=color)

root.geometry("500x500")

bottomframe = Frame(root)
bottomframe.pack(side=BOTTOM)

redbutton = Button(frame, text="Red", fg="red", command=change_color("red"))
redbutton.pack(side=LEFT)

greenbutton = Button(frame, text="Brown", fg="brown", command=change_color("brown"))
greenbutton.pack(side=LEFT)

bluebutton = Button(frame, text="Blue", fg="blue", command=change_color("blue"))
bluebutton.pack(side=LEFT)

blackbutton = Button(bottomframe, text="Black", fg="black", command=change_color("black"))
blackbutton.pack(side=BOTTOM)


root.mainloop()