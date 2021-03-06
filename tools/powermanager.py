#!/usr/bin/env python3
import tkinter as tk
import time
import os

sleep_time = 5 #min
bat_value_lim = 10

while( True ):
    pm_info = '\nWARNING !!!\n\n'
    shell_cmd = "upower -i $(upower -e | grep \'BAT\') | grep -E \'state|percentage\'"
    shell_cmd_return = os.popen( shell_cmd )
    bat_info = shell_cmd_return.read()
    bat_info = bat_info.split()
    i = 0
    bat_value = 0
    #print( bat_info )
    while( i < len( bat_info ) ):
        tmp = "%s %s\n"%( bat_info[i], bat_info[i+1] )
        pm_info += tmp
        if ( bat_info[i] == 'percentage:' ):
            bat_value = float(bat_info[i+1][:-1])
        if ( bat_info[i] == 'state:' ):
            if (bat_info[i+1] == 'discharging'):
                charge_state = 0
            else:
                charge_state = 1
        i += 2
    #print( charge_state )
    pm_info += '\n' + time.asctime(time.localtime(time.time())) + '\n'
    if ( charge_state == 1 ):
        sleep_time = 5
    if ( bat_value <= bat_value_lim and charge_state == 0 ):
        pm_win = tk.Tk()
        pm_win.title( 'powermanager' )
        win_width = 150
        win_height = 150
        win_xpos = pm_win.winfo_screenwidth() // 2 - win_width // 2
        win_ypos = pm_win.winfo_screenheight() // 2 - win_height // 2
        pm_win.geometry( '%dx%d+%d+%d'%(win_width, win_height, win_xpos, win_ypos) )
        pm_label = tk.Label( pm_win, text=pm_info )
        pm_button = tk.Button( pm_win, text='Close', command=pm_win.destroy )
        pm_label.pack()
        pm_button.pack()
        pm_win.mainloop()
        if ( bat_value <= 5 ):
            sleep_time = 1
    time.sleep( sleep_time * 60 )
