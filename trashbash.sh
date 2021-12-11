#trash bin gets hidden from .local/share/ for some reason
if [[ ! -d /"$HOME"/.local/share/Trash/files && ! -d /home/be/Desktop/files ]] ; then 
    echo "does not exist"
    #creates symbolic link to trash file must delete later
    ln -s /home/be/.local/share/Trash/files /home/be/Desktop


    #shred all in trash bin
    sudo find /home/be/.local/share/Trash/files -exec shred {} -uvz \;
    #sudo find /home/be/.local/share/Trash/files -type d -exec shred {} -u \; #all sorts of faliures
    #not ideal but just wurks
    rm -rf /home/be/Desktop/files

fi
if [[ -d /home/be/Desktop/files ]] ; then
    echo "exists"

    #shred all in trash bin
    sudo find /home/be/.local/share/Trash/files -exec shred {} -uvz \;
    #sudo find /home/be/.local/share/Trash/files -type d -exec shred {} -u \; #all sorts of faliures
    #not ideal but just wurks
    rm -rf /home/be/Desktop/files
fi