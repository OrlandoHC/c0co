#!/bin/bash

while :
do
    clear
    cat<<EOF
    ==============================
            Nokia N-900
   CONSOLE CONTROL REMOTE v0.1.0-beta
       BY @OrlandoHC(Masterkey) 
    ------------------------------
    Selecciona una Opción:

    Desbloquear             (1)
    Bloquear                (2)
    Tomar Foto (Frontal)    (3)
    Reiniciar               (4)
    Apagar (Emergencia)     (5)
    Salir                   (X)
    
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  dbus-send --system --type=method_call --dest=com.nokia.mce /com/nokia/mce/request com.nokia.mce.request.req_tklock_mode_change string:"unlocked" ;;
    "2")  dbus-send --system --type=method_call --dest=com.nokia.mce /com/nokia/mce/request com.nokia.mce.request.req_tklock_mode_change string:"locked" ;;
    "3")  /bin/sleep 10 ; /usr/bin/gst-launch v4l2camsrc device=/dev/video1 num-buffers=1 \! video/x-raw-yuv,width=640,height=480  \! ffmpegcolorspace \! jpegenc \! filesink location=/home/user/MyDocs/DCIM/photo.jpg ;;
    "s")  echo "Mayus -_-"   ;;
    "X")  exit 0;; 
     * )  echo "Opcion Invalida"     ;;
    esac
    sleep 1
done
