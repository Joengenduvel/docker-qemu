FROM alpine

RUN apk add qemu qemu-system-arm
RUN wget https://github.com/hypriot/image-builder-rpi/releases/download/v1.9.0/hypriotos-rpi-v1.9.0.img.zip\
 && unzip hypriotos*\
 && rm *.zip
CMD qemu-system-arm -M raspi2\
 -hda *.img\
 -m 256\
 -append "root=/dev/sda2"\
 -net nic\
 -net user,hostfwd=tcp::2222-:22
