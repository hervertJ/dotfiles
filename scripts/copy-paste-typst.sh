#!/usr/bin/env bash

RUTA="$HOME"

#if /usr/bin/wl-paste --list-types | /usr/bin/grep -qx 'image/png' ;then
#    /usr/bin/wl-paste --type image/png > "${RUTA}/$(/usr/bin/date +%Y%m%d_%H%M%S).png"
#
#elif /usr/bin/wl-paste --list-types | /usr/bin/grep -qx 'image/jpeg'; then
#    /usr/bin/wl-paste --type image/jpeg > "${RUTA}/$(/usr/bin/date +%Y%m%d_%H%M%S).jpg"
#
#else
#    echo "El portapapeles no contiene una imagen PNG o JPEG."
#fi

if wl-paste --list-types | grep -qx 'image/png' ;then
    wl-paste --type image/png > "${RUTA}/$(date +%Y%m%d_%H%M%S).png"

elif wl-paste --list-types | grep -qx 'image/jpeg'; then
    wl-paste --type image/jpeg > "${RUTA}/$(date +%Y%m%d_%H%M%S).jpg"

else
    echo "El portapapeles no contiene una imagen PNG o JPEG."
fi
