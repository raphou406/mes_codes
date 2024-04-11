from tkinter import *

def modifCouleur(color :str):
    fenetre['bg'] = color

fenetre = Tk()
#fenetre.geometry("400x400")
fenetre.title("pétanque.findMatch")

label = Label(fenetre, text="je suis un text")
label.pack()


bouton_rouge = Button(fenetre, text="Rouge", fg='red')
bouton_vert = Button(fenetre, text="Vert", fg='green')
bouton_noir = Button(fenetre, text="Noir", fg='black')
bouton_quit = Button(fenetre, text="Quitter", command=fenetre.quit)
bouton_rouge.pack()
bouton_noir.pack()
bouton_vert.pack()
bouton_quit.pack()

fenetre.mainloop()
