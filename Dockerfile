FROM alpine

RUN apk add qemu qemu-system-arm \
 && adduser -S qemu -G kvm,qemu
 
RUN wget https://github.com/hypriot/image-builder-rpi/releases/download/v1.9.0/hypriotos-rpi-v1.9.0.img.zip\
 && unzip hypriotos*\
 && rm *.zip
RUN wget https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/kernel-qemu-4.4.34-jessie

USER qemu
CMD qemu-system-arm -M raspi2\
 -drive format=raw,file=hypriotos-rpi-v1.9.0.img\
 -kernel kernel-qemu-4.4.34-jessie\
 -m 256\
 -append "root=/dev/sda2"
 -enable-kvm
