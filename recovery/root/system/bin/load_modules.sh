#!/system/bin/sh

module_path=/vendor/lib/modules

load_modules()
{
	insmod $module_path/exfat.ko
	insmod $module_path/utags.ko
	insmod $module_path/sensors_class.ko
	insmod $module_path/mmi_annotate.ko
	insmod $module_path/mmi_info.ko
	insmod $module_path/tzlog_dump.ko
	insmod $module_path/mmi_sys_temp.ko
	insmod $module_path/focaltech_0flash_mmi.ko
	insmod $module_path/sx933x_sar.ko
	insmod $module_path/aw8695.ko
	insmod $module_path/tps61280.ko
	insmod $module_path/qpnp-smbcharger-mmi.ko
	insmod $module_path/qpnp-power-on-mmi.ko
}

load_modules

exit 0
