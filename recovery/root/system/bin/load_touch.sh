#!/system/bin/sh

firmware_path=/vendor/firmware
touch_class_path=/sys/devices/platform/soc/4a88000.spi/spi_master/spi0/spi0.0/input/input2/device
touch_path=
firmware_file=

load_touch()
{
	touch_product_string=$(ls /sys/class/touchscreen/ft8756)
	panel_supplier=""
	panel_supplier=$(cat /sys/devices/platform/soc/4a88000.spi/spi_master/spi0/spi0.0/input/*/device/panel_supplier)
	    echo "panel supplier vendor is: [$panel_supplier]"
	    cd $firmware_path
	    case $panel_supplier in
	        tianma)
			    firmware_file="focaltech-tianma-ft8756-0c-01-sofia.bin"
	            ;;
	        auo)
			    firmware_file="focaltech-auo-ft8756-09-01-sofia.bin"
	            ;;
	        *)
			    firmware_file="focaltech-ft8756-03-01-sofia.bin"
	            ;;
	    esac
	echo "Firmware file for upgrade $firmware_file"
	echo "forcing firmware upgrade"
	echo 1 > $touch_class_path/forcereflash
	echo "sending reflash command"
	echo $firmware_file > $touch_class_path/doreflash
	sleep 1.5
	setprop touch.fw.loaded 1
}

load_touch

exit 0
