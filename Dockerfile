FROM alpine

RUN apk add qemu qemu-system-arm \
 && adduser -S qemu -g qemu -G kvm
 
 
USER qemu
RUN cd ~\
 && wget https://github.com/hypriot/image-builder-rpi/releases/download/v1.9.0/hypriotos-rpi-v1.9.0.img.zip\
 && unzip hypriotos*\
 && rm *.zip
RUN cd ~\
 && wget https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/kernel-qemu-4.4.34-jessie

CMD cd ~\
 && qemu-system-arm -cpu arm1176 -m 256 -M versatilepb-no-reboot -drive format=raw,file=hypriotos-rpi-v1.9.0.img,index=0,media=disk -kernel kernel-qemu-4.4.34-jessie -m 256 -append root=/dev/sda2 -nographic -net nic -net user,restrict=off
