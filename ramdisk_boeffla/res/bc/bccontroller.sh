# Boeffla-Config controller interface
#
# Version: GPU 5 frequencies
#
# (C) andip71

# ********************************
# Kernel specific initialisation
# ********************************

# kernel specification (hardware; type; target; url)
KERNEL_SPECS="i9305;samsung;jb43;-"

# path to kernel libraries
LIBPATH="/lib/modules"				# Samsung
#LIBPATH="/system/lib/modules"		# Cyanogenmod+Omni


# *******************
# List of values
# *******************

if [ "lov_gov_profiles" == "$1" ]; then
	echo "pegasusq - boeffla moderate;pegasusq - boeffla battery saving;pegasusq - boeffla 1 core;pegasusq - boeffla 2 cores;pegasusq - speedmod;zzmoove - optimal;zzmoove - battery;zzmoove - battery yank;zzmoove - battery extreme yank;zzmoove - performance;pegasusqplus - balanced;pegasusqplus - battery"
	exit 0
fi

if [ "lov_cpu_volt_profiles" == "$1" ]; then
	echo "undervolt -25mV;undervolt -50mV;undervolt -75mV;undervolt -100mV;undervolt light;undervolt medium;undervolt heavy"
	exit 0
fi

if [ "lov_gpu_freq_profiles" == "$1" ]; then
	echo "54 only;160 only;160/266;266/350;54/108/160/200/266;108/160/200/266/350;160/266/350/440/533 (default);266/350/440/533/600;350/440/533/600/640;440/533/600/640/700"
	exit 0
fi

if [ "lov_gpu_volt_profiles" == "$1" ]; then
	echo "undervolt -25mV;undervolt -50mV;undervolt -75mV;undervolt -100mV;undervolt light;undervolt medium;undervolt heavy;overvolt +25mV;overvolt +50mV;overvolt +75mV;overvolt +100mV"
	exit 0
fi

if [ "lov_gpu_freq" == "$1" ]; then
	echo "54;108;160;200;266;300;350;400;440;500;533;600;640;700"
	exit 0
fi

if [ "lov_eq_gain_profiles" == "$1" ]; then
	echo "Archis audiophile;Baseland;Bass extreme;Bass treble;Classic;Dance;Eargasm;Hbohd;Metal/Rock;Pleasant;PST;Treble"
	exit 0
fi

if [ "lov_system_tweaks" == "$1" ]; then
	echo "Off;Frandom tweaks;Boeffla tweaks;Speedmod tweaks;Mattiadj tweaks"
	exit 0
fi

if [ "lov_modules" == "$1" ]; then
	ls $LIBPATH/*
	exit 0
fi

if [ "lov_presets" == "$1" ]; then
	# Note, the ^ sign will be translated into newline for this setting
	echo "Power extreme~"
	echo "Gov: lulzactiveq / no profile"
	echo "^Sched: row / row"
	echo "^CPU: 1600 / no uv"
	echo "^GPU: 440-700 / +25mV;"
	
	echo "Power~"
	echo "Gov: zzmoove / zzmoove-performance"
	echo "^Sched: row / row"
	echo "^CPU: 1500 / no uv"
	echo "^GPU: 266-600 / no uv;"
	
	echo "Standard~"
	echo "Gov: pegasusq / no profile"
	echo "^Sched: cfq / cfq"
	echo "^CPU: 1400 / no uv"
	echo "^GPU: 160-440 / no uv;"
	
	echo "Battery friendly~"
	echo "Gov: pegasusq / boeffla-moderate"
	echo "^Sched: cfq / cfq"
	echo "^CPU: 1400 / -25mV"
	echo "^GPU: 160/266 / -25mV;"
	
	echo "Battery saving~"
	echo "Gov: zzmoove / zzmoove-battery"
	echo "^Sched: cfq / cfq"
	echo "^CPU: 1000 / light uv"
	echo "^GPU: 160/266 / light uv;"

	echo "Hbohd preset~"
	echo "Gov: zzmoove / zzmoove-extreme battery yank"
	echo "^Sched: zen / zen"
	echo "^CPU: 1200 / medium uv"
	echo "^GPU: 266/350 / medium uv;"
	
	echo "Pst preset~"
	echo "Gov: zzmoove / zzmoove-optimal"
	echo "^Sched: row / row"
	echo "^CPU: 1400 / light uv"
	echo "^GPU: 160-533 / light uv;"
	
	exit 0
fi


# ************************************
# Configuration values (for profiles)
# ************************************

if [ "conf_presets" == "$1" ]; then
	if [ "Power extreme" ==  "$2" ]; then
		# gov, gov prof, sched int, sched ext, cpu max, cpu uv, gpu freq, gpu uv
		echo "lulzactiveq;None;"
		echo "row;row;"
		echo "1600000;None;"
		echo "440/533/600/640/700;overvolt +25mV"
	fi
	if [ "Power" ==  "$2" ]; then
		# gov, gov prof, sched int, sched ext, cpu max, cpu uv, gpu freq, gpu uv
		echo "zzmoove;zzmoove - performance;"
		echo "row;row;"
		echo "1500000;None;"
		echo "266/350/440/533/600;None"
	fi
	if [ "Standard" ==  "$2" ]; then
		# gov, gov prof, sched int, sched ext, cpu max, cpu uv, gpu freq, gpu uv
		echo "pegasusq;None;"
		echo "cfq;cfq;"
		echo "1400000;None;"
		echo "None;None"
	fi
	if [ "Battery friendly" ==  "$2" ]; then
		# gov, gov prof, sched int, sched ext, cpu max, cpu uv, gpu freq, gpu uv
		echo "pegasusq;pegasusq - boeffla moderate;"
		echo "cfq;cfq;"
		echo "1400000;undervolt -25mV;"
		echo "160/266;undervolt -25mV"
	fi
	if [ "Battery saving" ==  "$2" ]; then
		# gov, gov prof, sched int, sched ext, cpu max, cpu uv, gpu freq, gpu uv
		echo "zzmoove;zzmoove - battery;"
		echo "cfq;cfq;"
		echo "1000000;undervolt light;"
		echo "160/266;undervolt light"
	fi
	if [ "Hbohd" ==  "$2" ]; then
		# gov, gov prof, sched int, sched ext, cpu max, cpu uv, gpu freq, gpu uv
		echo "zzmoove;zzmoove - battery extreme yank;"
		echo "zen;zen;"
		echo "1200000;undervolt medium;"
		echo "266/350;undervolt medium"
	fi
	if [ "Pst preset" ==  "$2" ]; then
		# gov, gov prof, sched int, sched ext, cpu max, cpu uv, gpu freq, gpu uv
		echo "zzmoove;zzmoove - optimal;"
		echo "row;row;"
		echo "1400000;undervolt light;"
		echo "None;undervolt light"
	fi
	exit 0
fi


if [ "conf_gpu_freq" == "$1" ]; then
	if [ "54 only" == "$2" ]; then
		echo "54;54;54;54;54"
	fi
	if [ "160 only" == "$2" ]; then
		echo "160;160;160;160;160"
	fi
	if [ "160/266" == "$2" ]; then
		echo "160;160;160;266;266"
	fi
	if [ "266/350" == "$2" ]; then
		echo "266;266;266;350;350"
	fi
	if [ "54/108/160/200/266" == "$2" ]; then
		echo "54;108;160;200;266"
	fi
	if [ "108/160/200/266/350" == "$2" ]; then
		echo "108;160;200;266;350"
	fi
	if [ "160/266/350/440/533 (default)" == "$2" ]; then
		echo "160;266;350;440;533"
	fi
	if [ "266/350/440/533/600" == "$2" ]; then
		echo "266;350;440;533;600"
	fi
	if [ "350/440/533/600/640" == "$2" ]; then
		echo "350;440;533;600;640"
	fi
	if [ "440/533/600/640/700" == "$2" ]; then
		echo "440;533;600;640;700"
	fi
	exit 0
fi


if [ "conf_gpu_volt" == "$1" ]; then
	if [ "undervolt -25mV" == "$2" ]; then
		echo "-25000;-25000;-25000;-25000;-25000"
	fi
	if [ "undervolt -50mV" == "$2" ]; then
		echo "-50000;-50000;-50000;-50000;-50000"
	fi
	if [ "undervolt -75mV" == "$2" ]; then
		echo "-75000;-75000;-75000;-75000;-75000"
	fi
	if [ "undervolt -100mV" == "$2" ]; then
		echo "-100000;-100000;-100000;-100000;-100000"
	fi
	if [ "undervolt light" == "$2" ]; then
		echo "-25000;-25000;-25000;-50000;-50000"
	fi
	if [ "undervolt medium" == "$2" ]; then
		echo "-50000;-50000;-50000;-75000;-75000"
	fi
	if [ "undervolt heavy" == "$2" ]; then
		echo "-75000;-75000;-75000;-100000;-100000"
	fi
	if [ "overvolt +25mV" == "$2" ]; then
		echo "25000;25000;25000;25000;25000"
	fi
	if [ "overvolt +50mV" == "$2" ]; then
		echo "50000;50000;50000;50000;50000"
	fi
	if [ "overvolt +75mV" == "$2" ]; then
		echo "75000;75000;75000;75000;75000"
	fi
	if [ "overvolt +100mV" == "$2" ]; then
		echo "100000;100000;100000;100000;100000"
	fi
	exit 0
fi

if [ "conf_cpu_volt" == "$1" ]; then
	if [ "undervolt -25mV" == "$2" ]; then
		echo "-25;-25;-25;-25;-25;-25;-25;-25;-25;-25;-25;-25;-25;-25;-25"
	fi
	if [ "undervolt -50mV" == "$2" ]; then
		echo "-50;-50;-50;-50;-50;-50;-50;-50;-50;-50;-50;-50;-50;-50;-50"
	fi
	if [ "undervolt -75mV" == "$2" ]; then
		echo "-75;-75;-75;-75;-75;-75;-75;-75;-75;-75;-75;-75;-75;-75;-75"
	fi
	if [ "undervolt -100mV" == "$2" ]; then
		echo "-100;-100;-100;-100;-100;-100;-100;-100;-100;-100;-100;-100;-100;-100;-100"
	fi
	if [ "undervolt light" == "$2" ]; then
		echo "0;0;0;0;0;0;-25;-25;-25;-25;-25;-50;-50;-50;-50"
	fi
	if [ "undervolt medium" == "$2" ]; then
		echo "-25;-25;-25;-25;-25;-25;-50;-50;-50;-50;-50;-75;-75;-75;-75"
	fi
	if [ "undervolt heavy" == "$2" ]; then
		echo "-50;-50;-50;-50;-50;-50;-75;-75;-75;-75;-75;-100;-100;-100;-100"
	fi
	exit 0
fi

if [ "conf_eq_gains" == "$1" ]; then
	if [ "Archis audiophile" ==  "$2" ]; then
		echo "8;4;4;2;6"
	fi
	if [ "Hbohd" ==  "$2" ]; then
		echo "9;7;4;4;5"
	fi
	if [ "Eargasm" ==  "$2" ]; then
		echo "12;8;4;2;3"
	fi
	if [ "Pleasant" ==  "$2" ]; then
		echo "4;3;2;2;3"
	fi
	if [ "PST" ==  "$2" ]; then
		echo "6;4;4;2;4"
	fi
	if [ "Classic" ==  "$2" ]; then
		echo "0;0;0;-3;-5"
	fi
	if [ "Bass treble" ==  "$2" ]; then
		echo "10;7;0;2;5"
	fi
	if [ "Bass extreme" ==  "$2" ]; then
		echo "12;8;3;-1;1"
	fi
	if [ "Treble" ==  "$2" ]; then
		echo "-5;1;0;4;3"
	fi
	if [ "Baseland" ==  "$2" ]; then
		echo "8;7;4;3;3"
	fi
	if [ "Dance" ==  "$2" ]; then
		echo "4;0;-6;0;3"
	fi
	if [ "Metal/Rock" ==  "$2" ]; then
		echo "4;3;0;-4;3"
	fi
	exit 0
fi

# *******************
# Parameters
# *******************

if [ "param_readahead" == "$1" ]; then
	# Internal sd (min/max/steps)
	echo "128;3072;128;"
	# External sd (min/max/steps)
	echo "128;3072;128"
	exit 0
fi

if [ "param_boeffla_sound" == "$1" ]; then
	# Headphone min/max, Speaker min/max
	echo "20;63;20;63;"
	# Equalizer min/max
	echo "-12;12;"
	# Microphone gain min/max
	echo "0;31;"
	# Stereo expansion min/max
	echo "0;31"
	exit 0
fi

if [ "param_cpu_uv" == "$1" ]; then
	# CPU UV min/max/steps
	echo "600;1500;25"
	exit 0
fi

if [ "param_gpu_uv" == "$1" ]; then
	# GPU UV min/max/steps
	echo "500000;1200000;25000"
	exit 0
fi

if [ "param_led" == "$1" ]; then
	# LED speed min/max/steps
	echo "0;15;1;"
	# LED brightness min/max/steps
	echo "0;130;5"
	exit 0
fi

if [ "param_touchwake" == "$1" ]; then
	# Touchwake min/max/steps
	echo "0;600000;5000"
	exit 0
fi

if [ "param_early_suspend_delay" == "$1" ]; then
	# Early suspend delay min/max/steps
	echo "0;700;25"
	exit 0
fi

if [ "param_zram" == "$1" ]; then
	# zRam size min/max/steps
	echo "104857600;838860800;20971520"
	exit 0
fi

if [ "param_charge_rates" == "$1" ]; then
	# AC charge min/max/steps
	echo "100;1600;25;"
	# USB charge min/max/steps
	echo "0;1600;25;"
	# Wireless charge min/max/steps
	echo "100;1000;25"
	exit 0
fi

if [ "param_lmk" == "$1" ]; then
	# LMK size min/max/steps
	echo "5;300;1"
	exit 0
fi


# *******************
# Get settings
# *******************

if [ "get_ums" == "$1" ]; then
	if [ "`busybox grep 179 /sys/devices/platform/s3c-usbgadget/gadget/lun0/file`" ]; then
		echo "1"
	else
		echo "0"
	fi
	exit 0
fi


if [ "get_tunables" == "$1" ]; then
	if [ -d /sys/devices/system/cpu/cpufreq/$2 ]; then
		cd /sys/devices/system/cpu/cpufreq/$2
		for file in *
		do
			content="`busybox cat $file`"
			busybox echo -ne "$file~$content;"
		done
	fi
fi


if [ "get_kernel_version2" == "$1" ]; then
	busybox cat /proc/version
	exit 0
fi


if [ "get_kernel_specs" == "$1" ]; then
	echo $KERNEL_SPECS
	exit 0
fi


# *******************
# Applying settings
# *******************

if [ "apply_governor_profile" == "$1" ]; then
	if [ "pegasusq - standard" == "$2" ]; then
		# cpu2
		echo "500000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_1_1
		echo "200000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_0
		echo "100" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_1_1
		echo "100" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_0
		# cpu3
		echo "500000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_1
		echo "200000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_0
		echo "200" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_1
		echo "200" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_0
		# cpu4
		echo "500000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_1
		echo "200000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_4_0
		echo "300" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_1
		echo "300" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_4_0

		echo "20" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_down_rate
		echo "10" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_up_rate
		echo "85" > /sys/devices/system/cpu/cpufreq/pegasusq/up_threshold
		echo "37" > /sys/devices/system/cpu/cpufreq/pegasusq/freq_step
	fi

	if [ "pegasusq - boeffla 1 core" == "$2" ]; then
		# cpu2
		echo "1400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_1_1
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_0
		echo "3000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_1_1
		echo "3000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_0
		# cpu3
		echo "1400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_1
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_0
		echo "4000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_1
		echo "4000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_0
		# cpu4
		echo "1400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_1
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_4_0
		echo "5000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_1
		echo "5000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_4_0

		echo "20" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_down_rate
		echo "10" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_up_rate
		echo "85" > /sys/devices/system/cpu/cpufreq/pegasusq/up_threshold
		echo "37" > /sys/devices/system/cpu/cpufreq/pegasusq/freq_step
	fi

	if [ "pegasusq - boeffla 2 cores" == "$2" ]; then
		# cpu2
		echo "500000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_1_1
		echo "200000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_0
		echo "100" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_1_1
		echo "100" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_0
		# cpu3
		echo "1400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_1
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_0
		echo "4000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_1
		echo "4000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_0
		# cpu4
		echo "1400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_1
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_4_0
		echo "5000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_1
		echo "5000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_4_0

		echo "20" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_down_rate
		echo "10" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_up_rate
		echo "85" > /sys/devices/system/cpu/cpufreq/pegasusq/up_threshold
		echo "37" > /sys/devices/system/cpu/cpufreq/pegasusq/freq_step
	fi

	if [ "pegasusq - speedmod" == "$2" ]; then
		# cpu2
		echo "500000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_1_1
		echo "400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_0
		echo "100" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_1_1
		echo "100" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_0
		# cpu3
		echo "800000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_1
		echo "600000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_0
		echo "200" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_1
		echo "200" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_0
		# cpu4
		echo "800000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_1
		echo "600000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_4_0
		echo "300" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_1
		echo "300" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_4_0

		echo "10" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_down_rate
		echo "10" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_up_rate
		echo "85" > /sys/devices/system/cpu/cpufreq/pegasusq/up_threshold
		echo "37" > /sys/devices/system/cpu/cpufreq/pegasusq/freq_step
	fi

	if [ "pegasusq - boeffla battery saving" == "$2" ]; then
		# cpu2
		echo "1400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_1_1
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_0
		echo "500" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_1_1
		echo "500" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_0
		# cpu3
		echo "1400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_1
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_0
		echo "550" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_1
		echo "550" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_0
		# cpu4
		echo "1400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_1
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_4_0
		echo "600" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_1
		echo "600" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_4_0

		echo "10" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_down_rate
		echo "5" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_up_rate
		echo "95" > /sys/devices/system/cpu/cpufreq/pegasusq/up_threshold
		echo "25" > /sys/devices/system/cpu/cpufreq/pegasusq/freq_step
	fi

	if [ "pegasusq - boeffla moderate" == "$2" ]; then
		# cpu2
		echo "800000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_1_1
		echo "700000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_0
		echo "100" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_1_1
		echo "100" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_0
		# cpu3
		echo "1100000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_1
		echo "1000000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_0
		echo "300" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_1
		echo "300" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_0
		# cpu4
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_1
		echo "1200000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_4_0
		echo "400" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_1
		echo "400" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_4_0

		echo "10" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_down_rate
		echo "10" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_up_rate
		echo "85" > /sys/devices/system/cpu/cpufreq/pegasusq/up_threshold
		echo "37" > /sys/devices/system/cpu/cpufreq/pegasusq/freq_step

	fi

	if [ "pegasusqplus - standard" == "$2" ]; then
		echo "30" > /sys/devices/system/cpu/cpufreq/pegasusqplus/cpu_down_rate
		echo "2" > /sys/devices/system/cpu/cpufreq/pegasusqplus/cpu_online_bias_count
		echo "30" > /sys/devices/system/cpu/cpufreq/pegasusqplus/cpu_online_bias_down_threshold
		echo "65" > /sys/devices/system/cpu/cpufreq/pegasusqplus/cpu_online_bias_up_threshold
		echo "16" > /sys/devices/system/cpu/cpufreq/pegasusqplus/cpu_up_rate
		echo "5" > /sys/devices/system/cpu/cpufreq/pegasusqplus/down_differential
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/dvfs_debug
		echo "1200000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/freq_for_fast_down
		echo "400000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/freq_for_responsiveness
		echo "37" > /sys/devices/system/cpu/cpufreq/pegasusqplus/freq_step
		echo "13" > /sys/devices/system/cpu/cpufreq/pegasusqplus/freq_step_dec
		echo "500000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_1_1
		echo "200000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_2_0
		echo "500000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_2_1
		echo "200000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_3_0
		echo "700000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_3_1
		echo "400000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_4_0
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_lock
		echo "175" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_1_1
		echo "175" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_2_0
		echo "275" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_2_1
		echo "275" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_3_0
		echo "375" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_3_1
		echo "375" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_4_0
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/ignore_nice_load
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/lcdfreq_enable
		echo "20" > /sys/devices/system/cpu/cpufreq/pegasusqplus/lcdfreq_kick_in_down_delay
		echo "500000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/lcdfreq_kick_in_freq
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/max_cpu_lock
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/min_cpu_lock
		echo "1" > /sys/devices/system/cpu/cpufreq/pegasusqplus/sampling_down_factor
		echo "30000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/sampling_rate
		echo "10000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/sampling_rate_min
		echo "1" > /sys/devices/system/cpu/cpufreq/pegasusqplus/up_nr_cpus~1
		echo "82" > /sys/devices/system/cpu/cpufreq/pegasusqplus/up_threshold
		echo "95" > /sys/devices/system/cpu/cpufreq/pegasusqplus/up_threshold_at_fast_down
		echo "40" > /sys/devices/system/cpu/cpufreq/pegasusqplus/up_threshold_at_min_freq
		echo "6" > /sys/devices/system/cpu/cpufreq/pegasusqplus/up_threshold_diff
	fi

	if [ "pegasusqplus - balanced" == "$2" ]; then
		echo "30" > /sys/devices/system/cpu/cpufreq/pegasusqplus/cpu_down_rate
		echo "2" > /sys/devices/system/cpu/cpufreq/pegasusqplus/cpu_online_bias_count
		echo "52" > /sys/devices/system/cpu/cpufreq/pegasusqplus/cpu_online_bias_down_threshold
		echo "70" > /sys/devices/system/cpu/cpufreq/pegasusqplus/cpu_online_bias_up_threshold
		echo "16" > /sys/devices/system/cpu/cpufreq/pegasusqplus/cpu_up_rate
		echo "5" > /sys/devices/system/cpu/cpufreq/pegasusqplus/down_differential
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/dvfs_debug
		echo "1200000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/freq_for_fast_down
		echo "400000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/freq_for_responsiveness
		echo "4" > /sys/devices/system/cpu/cpufreq/pegasusqplus/freq_step
		echo "2" > /sys/devices/system/cpu/cpufreq/pegasusqplus/freq_step_dec
		echo "700000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_1_1
		echo "200000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_2_0
		echo "700000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_2_1
		echo "300000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_3_0
		echo "900000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_3_1
		echo "400000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_4_0
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_lock
		echo "275" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_1_1
		echo "275" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_2_0
		echo "375" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_2_1
		echo "375" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_3_0
		echo "450" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_3_1
		echo "450" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_4_0
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/ignore_nice_load
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/lcdfreq_enable
		echo "20" > /sys/devices/system/cpu/cpufreq/pegasusqplus/lcdfreq_kick_in_down_delay
		echo "500000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/lcdfreq_kick_in_freq
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/max_cpu_lock
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/min_cpu_lock
		echo "1" > /sys/devices/system/cpu/cpufreq/pegasusqplus/sampling_down_factor
		echo "32000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/sampling_rate
		echo "10000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/sampling_rate_min
		echo "1" > /sys/devices/system/cpu/cpufreq/pegasusqplus/up_nr_cpus~1
		echo "90" > /sys/devices/system/cpu/cpufreq/pegasusqplus/up_threshold
		echo "95" > /sys/devices/system/cpu/cpufreq/pegasusqplus/up_threshold_at_fast_down
		echo "55" > /sys/devices/system/cpu/cpufreq/pegasusqplus/up_threshold_at_min_freq
		echo "7" > /sys/devices/system/cpu/cpufreq/pegasusqplus/up_threshold_diff
	fi

	if [ "pegasusqplus - battery" == "$2" ]; then
		echo "30" > /sys/devices/system/cpu/cpufreq/pegasusqplus/cpu_down_rate
		echo "2" > /sys/devices/system/cpu/cpufreq/pegasusqplus/cpu_online_bias_count
		echo "52" > /sys/devices/system/cpu/cpufreq/pegasusqplus/cpu_online_bias_down_threshold
		echo "70" > /sys/devices/system/cpu/cpufreq/pegasusqplus/cpu_online_bias_up_threshold
		echo "16" > /sys/devices/system/cpu/cpufreq/pegasusqplus/cpu_up_rate
		echo "5" > /sys/devices/system/cpu/cpufreq/pegasusqplus/down_differential
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/dvfs_debug
		echo "1200000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/freq_for_fast_down
		echo "400000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/freq_for_responsiveness
		echo "4" > /sys/devices/system/cpu/cpufreq/pegasusqplus/freq_step
		echo "2" > /sys/devices/system/cpu/cpufreq/pegasusqplus/freq_step_dec
		echo "900000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_1_1
		echo "700000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_2_0
		echo "1000000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_2_1
		echo "800000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_3_0
		echo "1400000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_3_1
		echo "1100000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_freq_4_0
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_lock
		echo "300" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_1_1
		echo "300" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_2_0
		echo "375" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_2_1
		echo "375" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_3_0
		echo "450" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_3_1
		echo "450" > /sys/devices/system/cpu/cpufreq/pegasusqplus/hotplug_rq_4_0
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/ignore_nice_load
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/lcdfreq_enable
		echo "20" > /sys/devices/system/cpu/cpufreq/pegasusqplus/lcdfreq_kick_in_down_delay
		echo "500000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/lcdfreq_kick_in_freq
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/max_cpu_lock
		echo "0" > /sys/devices/system/cpu/cpufreq/pegasusqplus/min_cpu_lock
		echo "1" > /sys/devices/system/cpu/cpufreq/pegasusqplus/sampling_down_factor
		echo "32000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/sampling_rate
		echo "10000" > /sys/devices/system/cpu/cpufreq/pegasusqplus/sampling_rate_min
		echo "1" > /sys/devices/system/cpu/cpufreq/pegasusqplus/up_nr_cpus~1
		echo "90" > /sys/devices/system/cpu/cpufreq/pegasusqplus/up_threshold
		echo "95" > /sys/devices/system/cpu/cpufreq/pegasusqplus/up_threshold_at_fast_down
		echo "55" > /sys/devices/system/cpu/cpufreq/pegasusqplus/up_threshold_at_min_freq
		echo "7" > /sys/devices/system/cpu/cpufreq/pegasusqplus/up_threshold_diff
	fi

	if [ "zzmoove - standard" == "$2" ]; then
		# sampling rate and sampling down
		echo "100000" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate
		echo "4" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate_sleep_multiplier
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_factor
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_max_momentum
		echo "50" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_momentum_sensitivity
		# freq scaling and hotplugging
		echo "70" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold
		echo "100" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_sleep
		echo "75" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up
		echo "100" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up_sleep
		echo "68" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug1
		echo "68" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug2
		echo "68" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug3
		echo "52" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold
		echo "60" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_sleep
		echo "55" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug1
		echo "55" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug2
		echo "55" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug3
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/disable_hotplug
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_sleep
		# freqency stepping and limit
		echo "5" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step_sleep
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_limit
		echo "700000" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_limit_sleep
		# fast scaling
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling_sleep
		# early demand
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/early_demand
		echo "35" >/sys/devices/system/cpu/cpufreq/zzmoove/grad_up_threshold
		# nice load
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/ignore_nice_load
		# LCDFreq scaling
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_enable
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_cores
		echo "50" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_up_delay
		echo "20" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_down_delay
		echo "500000" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_freq
		# Hotplug
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq1
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq2
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq3
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq1
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq2
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq3
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_block_cycles
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_idle_threshold
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/disable_hotplug_sleep
	fi

	if [ "zzmoove - battery" == "$2" ]; then
		# sampling rate and sampling down
		echo "100000" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate
		echo "4" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate_sleep_multiplier
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_factor
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_max_momentum
		echo "50" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_momentum_sensitivity
		# freq scaling and hotplugging
		echo "95" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold
		echo "100" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_sleep
		echo "75" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up
		echo "100" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up_sleep
		echo "60" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug1
		echo "80" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug2
		echo "98" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug3
		echo "40" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold
		echo "60" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_sleep
		echo "45" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug1
		echo "55" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug2
		echo "65" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug3
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/disable_hotplug
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_sleep
		# freqency stepping and limit
		echo "10" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step_sleep
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_limit
		echo "800000" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_limit_sleep
		# fast scaling
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling
		echo "2" >/sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling_sleep
		# early demand
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/early_demand
		echo "50" >/sys/devices/system/cpu/cpufreq/zzmoove/grad_up_threshold
		# nice load
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/ignore_nice_load
		# LCDFreq scaling
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_enable
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_cores
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_up_delay
		echo "5" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_down_delay
		echo "500000" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_freq
		# Hotplug (reset freq thresholds)
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq1
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq2
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq3
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq1
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq2
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq3
		# Hotplug
		echo "700000" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq1
		echo "1000000" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq2
		echo "1200000" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq3
		echo "600000" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq1
		echo "800000" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq2
		echo "1000000" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq3
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_block_cycles
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_idle_threshold
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/disable_hotplug_sleep
	fi

	if [ "zzmoove - optimal" == "$2" ]; then
		# sampling rate and sampling down
		echo "45000" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate
		echo "4" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate_sleep_multiplier
		echo "4" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_factor
		echo "20" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_max_momentum
		echo "50" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_momentum_sensitivity
		# freq scaling and hotplugging
		echo "67" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold
		echo "100" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_sleep
		echo "75" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up
		echo "100" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up_sleep
		echo "68" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug1
		echo "78" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug2
		echo "88" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug3
		echo "52" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold
		echo "60" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_sleep
		echo "45" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug1
		echo "55" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug2
		echo "65" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug3
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/disable_hotplug
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_sleep
		# freqency stepping and limit
		echo "5" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step_sleep
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_limit
		echo "800000" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_limit_sleep
		# fast scaling
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling
		echo "2" >/sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling_sleep
		# early demand
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/early_demand
		echo "35" >/sys/devices/system/cpu/cpufreq/zzmoove/grad_up_threshold
		# nice load
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/ignore_nice_load
		# LCDFreq scaling
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_enable
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_cores
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_up_delay
		echo "5" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_down_delay
		echo "500000" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_freq
		# Hotplug (reset freq thresholds)
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq1
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq2
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq3
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq1
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq2
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq3
		# Hotplug
		echo "500000" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq1
		echo "700000" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq2
		echo "900000" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq3
		echo "400000" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq1
		echo "600000" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq2
		echo "800000" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq3
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_block_cycles
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_idle_threshold
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/disable_hotplug_sleep
	fi

	if [ "zzmoove - performance" == "$2" ]; then
		# sampling rate and sampling down
		echo "40000" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate
		echo "4" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate_sleep_multiplier
		echo "4" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_factor
		echo "50" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_max_momentum
		echo "25" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_momentum_sensitivity
		# freq scaling and hotplugging
		echo "60" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold
		echo "100" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_sleep
		echo "70" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up
		echo "100" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up_sleep
		echo "65" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug1
		echo "75" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug2
		echo "85" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug3
		echo "20" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold
		echo "60" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_sleep
		echo "25" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug1
		echo "35" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug2
		echo "45" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug3
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/disable_hotplug
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_sleep
		# freqency stepping and limit
		echo "25" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step_sleep
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_limit
		echo "800000" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_limit_sleep
		# fast scaling
		echo "2" >/sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling
		echo "2" >/sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling_sleep
		# early demand
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/early_demand
		echo "25" >/sys/devices/system/cpu/cpufreq/zzmoove/grad_up_threshold
		# nice load
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/ignore_nice_load
		# LCDFreq scaling
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_enable
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_cores
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_up_delay
		echo "5" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_down_delay
		echo "500000" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_freq
		# Hotplug (reset freq thresholds)
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq1
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq2
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq3
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq1
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq2
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq3
		# Hotplug
		echo "400000" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq1
		echo "800000" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq2
		echo "1000000" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq3
		echo "300000" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq1
		echo "700000" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq2
		echo "900000" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq3
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_block_cycles
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_idle_threshold
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/disable_hotplug_sleep
	fi

	if [ "zzmoove - battery extreme yank" == "$2" ]; then
		# zzmoove governor settings optimized for battery:
		echo "60000" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_factor
		echo "70" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold
		echo "50" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/ignore_nice_load
		echo "10" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step
		echo "75" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up

		# hotplug up threshold per core
		echo "90" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug1
		echo "95" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug2
		echo "98" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug3

		echo "1000000" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq1
		echo "1200000" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq2
		echo "1400000" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq3

		# hotplug down threshold per core
		echo "70" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug1
		echo "80" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug2
		echo "90" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug3

		echo "800000" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq1
		echo "1000000" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq2
		echo "1200000" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq3

		# hotplug block cycles
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_block_cycles

		# Screen off settings
		echo "4" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate_sleep_multiplier
		echo "85" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_sleep
		echo "75" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_sleep
		echo "1" > /sys/devices/system/cpu/cpufreq/zzmoove/freq_step_sleep
		echo "90" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up_sleep
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_sleep
	fi

	if [ "zzmoove - battery yank" == "$2" ]; then
		# zzmoove governor settings optimized for battery:
		echo "75000" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_factor
		echo "60" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold
		echo "40" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/ignore_nice_load
		echo "10" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step
		echo "65" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up

		# hotplug up threshold per core
		echo "85" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug1
		echo "90" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug2
		echo "98" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug3

		echo "1000000" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq1
		echo "1200000" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq2
		echo "1400000" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq3

		# hotplug down threshold per core
		echo "65" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug1
		echo "75" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug2
		echo "85" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug3

		echo "800000" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq1
		echo "1000000" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq2
		echo "1200000" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq3

		# hotplug block cycles
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_block_cycles

		# Screen off settings
		echo "4" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate_sleep_multiplier
		echo "85" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_sleep
		echo "75" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_sleep
		echo "1" > /sys/devices/system/cpu/cpufreq/zzmoove/freq_step_sleep
		echo "90" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up_sleep
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_sleep
	fi

	if [ "lulzactiveq - standard" == "$2" ]; then
		echo "20" >/sys/devices/system/cpu/cpufreq/lulzactiveq/cpu_down_rate
		echo "10" >/sys/devices/system/cpu/cpufreq/lulzactiveq/cpu_up_rate
		echo "0" >/sys/devices/system/cpu/cpufreq/lulzactiveq/debug_mode
		echo "50" >/sys/devices/system/cpu/cpufreq/lulzactiveq/dec_cpu_load
		echo "40000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/down_sample_time
		echo "0" >/sys/devices/system/cpu/cpufreq/lulzactiveq/dvfs_debug
		echo "1600000 1500000 1400000 1300000 1200000 1100000 1000000 900000 800000 700000 600000 500000 400000 300000 200000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/freq_table
		echo "1400000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hispeed_freq
		echo "500000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_1_1 
		echo "200000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_2_0 
		echo "500000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_2_1 
		echo "400000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_3_0 
		echo "800000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_3_1 
		echo "500000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_4_0 
		echo "0" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_lock
		echo "200" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_1_1 
		echo "200" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_2_0 
		echo "300" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_2_1 
		echo "300" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_3_0 
		echo "400" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_3_1 
		echo "400" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_4_0 
		echo "50000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_sampling_rate
		echo "0" >/sys/devices/system/cpu/cpufreq/lulzactiveq/ignore_nice_load
		echo "85" >/sys/devices/system/cpu/cpufreq/lulzactiveq/inc_cpu_load
		echo "0" >/sys/devices/system/cpu/cpufreq/lulzactiveq/max_cpu_lock
		echo "0" >/sys/devices/system/cpu/cpufreq/lulzactiveq/min_cpu_lock
		echo "1" >/sys/devices/system/cpu/cpufreq/lulzactiveq/pump_down_step
		echo "2" >/sys/devices/system/cpu/cpufreq/lulzactiveq/pump_up_step
		echo "11" >/sys/devices/system/cpu/cpufreq/lulzactiveq/screen_off_min_step
		echo "1" >/sys/devices/system/cpu/cpufreq/lulzactiveq/up_nr_cpus
		echo "20000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/up_sample_time
	fi

	if [ "ondemand - standard" == "$2" ]; then
		echo "3" >/sys/devices/system/cpu/cpufreq/ondemand/down_differential
		echo "100" >/sys/devices/system/cpu/cpufreq/ondemand/freq_step
		echo "0" >/sys/devices/system/cpu/cpufreq/ondemand/ignore_nice_load
		echo "0" >/sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
		echo "0" >/sys/devices/system/cpu/cpufreq/ondemand/powersave_bias
		echo "1" >/sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
		echo "100000" >/sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
		echo "10000" >/sys/devices/system/cpu/cpufreq/ondemand/sampling_rate_min
		echo "95" >/sys/devices/system/cpu/cpufreq/ondemand/up_threshold
	fi
	
	if [ "smartassV2 - standard" == "$2" ]; then
	      echo "800000" > /sys/devices/system/cpu/cpufreq/smartassV2/awake_ideal_freq
	      echo "0" > /sys/devices/system/cpu/cpufreq/smartassV2/debug_mask
	      echo "99000" > /sys/devices/system/cpu/cpufreq/smartassV2/down_rate_us
	      echo "55" > /sys/devices/system/cpu/cpufreq/smartassV2/max_cpu_load
	      echo "25" > /sys/devices/system/cpu/cpufreq/smartassV2/min_cpu_load
	      echo "300000" > /sys/devices/system/cpu/cpufreq/smartassV2/ramp_down_step
	      echo "200000" > /sys/devices/system/cpu/cpufreq/smartassV2/ramp_up_step
	      echo "2" > /sys/devices/system/cpu/cpufreq/smartassV2/sample_rate_jiffies
	      echo "200000" > /sys/devices/system/cpu/cpufreq/smartassV2/sleep_ideal_freq
	      echo "99999999" > /sys/devices/system/cpu/cpufreq/smartassV2/sleep_wakeup_freq
	      echo "48000" > /sys/devices/system/cpu/cpufreq/smartassV2/up_rate_us

	 fi
	
	exit 0
fi

if [ "apply_system_tweaks" == "$1" ]; then
<<<<<<< HEAD
	  if [ "Frandom tweaks" == "$2" ]; then
	      insmod $LIBPATH/frandom.ko ;
	      busybox ln -f /dev/frandom /dev/random ; 
	      busybox ln -f /dev/frandom /dev/erandom ;
	      busybox ln -f /dev/frandom /dev/urandom ;
	      busybox chmod 666 /dev/*random
	  fi
=======
	if [ "Off" == "$2" ]; then
		echo "16384" > /proc/sys/fs/inotify/max_queued_events
		echo "77749" > /proc/sys/fs/file-max
		echo "128" > /proc/sys/fs/inotify/max_user_instances
		echo "8192" > /proc/sys/fs/inotify/max_user_watches
		echo "45" > /proc/sys/fs/lease-break-time

		echo "8192" > /proc/sys/kernel/msgmax
		echo "1250" > /proc/sys/kernel/msgmni
		echo "1" > /proc/sys/kernel/panic
		echo "64" > /proc/sys/kernel/random/read_wakeup_threshold
		echo "128" > /proc/sys/kernel/random/write_wakeup_threshold
		echo "6666666" > /proc/sys/kernel/sched_latency_ns
		echo "1333332" > /proc/sys/kernel/sched_wakeup_granularity_ns
		echo "1500000" > /proc/sys/kernel/sched_min_granularity_ns
		echo "250 32000 32 128" > /proc/sys/kernel/sem
		echo "33554432" > /proc/sys/kernel/shmmax
		echo "12151" > /proc/sys/kernel/threads-max

		echo "131071" > /proc/sys/net/core/rmem_max
		echo "2097152" > /proc/sys/net/core/wmem_max
		echo "524288 1048576 2097152" > /proc/sys/net/ipv4/tcp_rmem
		echo "0" > /proc/sys/net/ipv4/tcp_tw_recycle
		echo "262144 524288 1048576" > /proc/sys/net/ipv4/tcp_wmem

		echo "5" > /proc/sys/vm/dirty_background_ratio
		echo "200" > /proc/sys/vm/dirty_expire_centisecs
		echo "20" > /proc/sys/vm/dirty_ratio
		echo "500" > /proc/sys/vm/dirty_writeback_centisecs
		echo "3638" > /proc/sys/vm/min_free_kbytes
		echo "60" > /proc/sys/vm/swappiness
		echo "100" > /proc/sys/vm/vfs_cache_pressure
		echo "0" > /proc/sys/vm/drop_caches

		echo "5" > /proc/sys/net/ipv4/tcp_syn_retries
		echo "5" > /proc/sys/net/ipv4/tcp_synack_retries
		echo "60" > /proc/sys/net/ipv4/tcp_fin_timeout

		if [ -e /dev/random.orig ]; then
			busybox rm /dev/random
			busybox mv /dev/random.orig /dev/random
			busybox chmod 644 /dev/random
			busybox rm /dev/urandom
			busybox mv /dev/urandom.orig /dev/urandom
			busybox chmod 644 /dev/urandom
		fi
	fi

	if [ "Frandom tweaks" == "$2" ]; then
		echo "16384" > /proc/sys/fs/inotify/max_queued_events
		echo "77749" > /proc/sys/fs/file-max
		echo "128" > /proc/sys/fs/inotify/max_user_instances
		echo "8192" > /proc/sys/fs/inotify/max_user_watches
		echo "45" > /proc/sys/fs/lease-break-time

		echo "8192" > /proc/sys/kernel/msgmax
		echo "1250" > /proc/sys/kernel/msgmni
		echo "1" > /proc/sys/kernel/panic
		echo "64" > /proc/sys/kernel/random/read_wakeup_threshold
		echo "128" > /proc/sys/kernel/random/write_wakeup_threshold
		echo "6666666" > /proc/sys/kernel/sched_latency_ns
		echo "1333332" > /proc/sys/kernel/sched_wakeup_granularity_ns
		echo "1500000" > /proc/sys/kernel/sched_min_granularity_ns
		echo "250 32000 32 128" > /proc/sys/kernel/sem
		echo "33554432" > /proc/sys/kernel/shmmax
		echo "12151" > /proc/sys/kernel/threads-max

		echo "131071" > /proc/sys/net/core/rmem_max
		echo "2097152" > /proc/sys/net/core/wmem_max
		echo "524288 1048576 2097152" > /proc/sys/net/ipv4/tcp_rmem
		echo "0" > /proc/sys/net/ipv4/tcp_tw_recycle
		echo "262144 524288 1048576" > /proc/sys/net/ipv4/tcp_wmem

		echo "5" > /proc/sys/vm/dirty_background_ratio
		echo "200" > /proc/sys/vm/dirty_expire_centisecs
		echo "20" > /proc/sys/vm/dirty_ratio
		echo "500" > /proc/sys/vm/dirty_writeback_centisecs
		echo "3638" > /proc/sys/vm/min_free_kbytes
		echo "60" > /proc/sys/vm/swappiness
		echo "100" > /proc/sys/vm/vfs_cache_pressure
		echo "0" > /proc/sys/vm/drop_caches

		echo "5" > /proc/sys/net/ipv4/tcp_syn_retries
		echo "5" > /proc/sys/net/ipv4/tcp_synack_retries
		echo "60" > /proc/sys/net/ipv4/tcp_fin_timeout

		insmod $LIBPATH/frandom.ko ;

		if [ ! -e /dev/random.orig ]; then
			busybox mv /dev/random /dev/random.orig
			busybox ln /dev/erandom /dev/random
			busybox chmod 644 /dev/random
			busybox mv /dev/urandom /dev/urandom.orig
			busybox ln /dev/erandom /dev/urandom
			busybox chmod 644 /dev/urandom
		fi
	fi
>>>>>>> 3956a52... Boeffla ramfs: Improve frandom handling + remove restart dependency with system tweaks

	if [ "Boeffla tweaks" == "$2" ]; then
		echo "32000" > /proc/sys/fs/inotify/max_queued_events
		echo "524288" > /proc/sys/fs/file-max
		echo "256" > /proc/sys/fs/inotify/max_user_instances
		echo "10240" > /proc/sys/fs/inotify/max_user_watches
		echo "10" > /proc/sys/fs/lease-break-time

		echo "65536" > /proc/sys/kernel/msgmax
		echo "2048" > /proc/sys/kernel/msgmni
		echo "10" > /proc/sys/kernel/panic
		echo "128" > /proc/sys/kernel/random/read_wakeup_threshold
		echo "256" > /proc/sys/kernel/random/write_wakeup_threshold
		echo "18000000" > /proc/sys/kernel/sched_latency_ns
		echo "3000000" > /proc/sys/kernel/sched_wakeup_granularity_ns
		echo "1500000" > /proc/sys/kernel/sched_min_granularity_ns
		echo "500 512000 64 2048" > /proc/sys/kernel/sem
		echo "268435456" > /proc/sys/kernel/shmmax
		echo "524288" > /proc/sys/kernel/threads-max

		echo "524288" > /proc/sys/net/core/rmem_max
		echo "524288" > /proc/sys/net/core/wmem_max
		echo "6144 87380 524288" > /proc/sys/net/ipv4/tcp_rmem
		echo "1" > /proc/sys/net/ipv4/tcp_tw_recycle
		echo "6144 87380 524288" > /proc/sys/net/ipv4/tcp_wmem

		echo "70" > /proc/sys/vm/dirty_background_ratio
		echo "250" > /proc/sys/vm/dirty_expire_centisecs
		echo "90" > /proc/sys/vm/dirty_ratio
		echo "500" > /proc/sys/vm/dirty_writeback_centisecs
		echo "4096" > /proc/sys/vm/min_free_kbytes
		echo "60" > /proc/sys/vm/swappiness
		echo "10" > /proc/sys/vm/vfs_cache_pressure
		echo "3" > /proc/sys/vm/drop_caches

		echo "5" > /proc/sys/net/ipv4/tcp_syn_retries
		echo "5" > /proc/sys/net/ipv4/tcp_synack_retries
		echo "60" > /proc/sys/net/ipv4/tcp_fin_timeout

		if [ -e /dev/random.orig ]; then
			busybox rm /dev/random
			busybox mv /dev/random.orig /dev/random
			busybox chmod 644 /dev/random
			busybox rm /dev/urandom
			busybox mv /dev/urandom.orig /dev/urandom
			busybox chmod 644 /dev/urandom
		fi
	fi

	if [ "Speedmod tweaks" == "$2" ]; then
		echo "16384" > /proc/sys/fs/inotify/max_queued_events
		echo "77749" > /proc/sys/fs/file-max
		echo "128" > /proc/sys/fs/inotify/max_user_instances
		echo "8192" > /proc/sys/fs/inotify/max_user_watches
		echo "45" > /proc/sys/fs/lease-break-time

		echo "8192" > /proc/sys/kernel/msgmax
		echo "1250" > /proc/sys/kernel/msgmni
		echo "1" > /proc/sys/kernel/panic
		echo "64" > /proc/sys/kernel/random/read_wakeup_threshold
		echo "128" > /proc/sys/kernel/random/write_wakeup_threshold
		echo "6666666" > /proc/sys/kernel/sched_latency_ns
		echo "1333332" > /proc/sys/kernel/sched_wakeup_granularity_ns
		echo "1500000" > /proc/sys/kernel/sched_min_granularity_ns
		echo "250 32000 32 128" > /proc/sys/kernel/sem
		echo "33554432" > /proc/sys/kernel/shmmax
		echo "12151" > /proc/sys/kernel/threads-max

		echo "131071" > /proc/sys/net/core/rmem_max
		echo "2097152" > /proc/sys/net/core/wmem_max
		echo "524288 1048576 2097152" > /proc/sys/net/ipv4/tcp_rmem
		echo "0" > /proc/sys/net/ipv4/tcp_tw_recycle
		echo "262144 524288 1048576" > /proc/sys/net/ipv4/tcp_wmem

		echo "5" > /proc/sys/vm/dirty_background_ratio
		echo "200" > /proc/sys/vm/dirty_expire_centisecs
		echo "20" > /proc/sys/vm/dirty_ratio
		echo "1500" > /proc/sys/vm/dirty_writeback_centisecs
		echo "12288" > /proc/sys/vm/min_free_kbytes
		echo "0" > /proc/sys/vm/swappiness
		echo "100" > /proc/sys/vm/vfs_cache_pressure
		echo "0" > /proc/sys/vm/drop_caches

		echo "2" > /proc/sys/net/ipv4/tcp_syn_retries
		echo "2" > /proc/sys/net/ipv4/tcp_synack_retries
		echo "10" > /proc/sys/net/ipv4/tcp_fin_timeout

		if [ -e /dev/random.orig ]; then
			busybox rm /dev/random
			busybox mv /dev/random.orig /dev/random
			busybox chmod 644 /dev/random
			busybox rm /dev/urandom
			busybox mv /dev/urandom.orig /dev/urandom
			busybox chmod 644 /dev/urandom
		fi
	fi

	if [ "Mattiadj tweaks" == "$2" ]; then
		echo "16384" > /proc/sys/fs/inotify/max_queued_events
		echo "77749" > /proc/sys/fs/file-max
		echo "128" > /proc/sys/fs/inotify/max_user_instances
		echo "8192" > /proc/sys/fs/inotify/max_user_watches
		echo "45" > /proc/sys/fs/lease-break-time

		echo "8192" > /proc/sys/kernel/msgmax
		echo "1250" > /proc/sys/kernel/msgmni
		echo "1" > /proc/sys/kernel/panic
		echo "64" > /proc/sys/kernel/random/read_wakeup_threshold
		echo "128" > /proc/sys/kernel/random/write_wakeup_threshold
		echo "6666666" > /proc/sys/kernel/sched_latency_ns
		echo "1333332" > /proc/sys/kernel/sched_wakeup_granularity_ns
		echo "1500000" > /proc/sys/kernel/sched_min_granularity_ns
		echo "250 32000 32 128" > /proc/sys/kernel/sem
		echo "33554432" > /proc/sys/kernel/shmmax
		echo "12151" > /proc/sys/kernel/threads-max

		echo "131071" > /proc/sys/net/core/rmem_max
		echo "2097152" > /proc/sys/net/core/wmem_max
		echo "524288 1048576 2097152" > /proc/sys/net/ipv4/tcp_rmem
		echo "0" > /proc/sys/net/ipv4/tcp_tw_recycle
		echo "262144 524288 1048576" > /proc/sys/net/ipv4/tcp_wmem

		echo "10" > /proc/sys/vm/dirty_background_ratio
		echo "500" > /proc/sys/vm/dirty_expire_centisecs
		echo "10" > /proc/sys/vm/dirty_ratio
		echo "100" > /proc/sys/vm/dirty_writeback_centisecs
		echo "8192" > /proc/sys/vm/min_free_kbytes
		echo "70" > /proc/sys/vm/swappiness
		echo "500" > /proc/sys/vm/vfs_cache_pressure
		echo "0" > /proc/sys/vm/drop_caches

		echo "5" > /proc/sys/net/ipv4/tcp_syn_retries
		echo "5" > /proc/sys/net/ipv4/tcp_synack_retries
		echo "60" > /proc/sys/net/ipv4/tcp_fin_timeout

		if [ -e /dev/random.orig ]; then
			busybox rm /dev/random
			busybox mv /dev/random.orig /dev/random
			busybox chmod 644 /dev/random
			busybox rm /dev/urandom
			busybox mv /dev/urandom.orig /dev/urandom
			busybox chmod 644 /dev/urandom
		fi
	fi
	exit 0
fi

if [ "apply_eq_bands" == "$1" ]; then
	echo "1 4027 1031 0 276" > /sys/class/misc/boeffla_sound/eq_bands
	echo "2 8076 61555 456 456" > /sys/class/misc/boeffla_sound/eq_bands
	echo "3 7256 62323 2644 1368" > /sys/class/misc/boeffla_sound/eq_bands
	echo "4 5774 63529 1965 4355" > /sys/class/misc/boeffla_sound/eq_bands
	echo "5 1380 1369 0 16384" > /sys/class/misc/boeffla_sound/eq_bands
	exit 0
fi

if [ "apply_ext4_tweaks" == "$1" ]; then
	if [ "1" == "$2" ]; then
		busybox sync
		mount -o remount,commit=20,noatime /dev/block/mmcblk0p12 /cache
		busybox sync
		mount -o remount,commit=20,noatime /dev/block/mmcblk0p16 /data
		busybox sync
	fi

	if [ "0" == "$2" ]; then
		busybox sync
		mount -o remount,commit=0,noatime /dev/block/mmcblk0p12 /cache
		busybox sync
		mount -o remount,commit=0,noatime /dev/block/mmcblk0p16 /data
		busybox sync
	fi
	exit 0
fi

if [ "apply_zram" == "$1" ]; then
	if [ "1" == "$2" ]; then
		if [ "1" == "$3" ]; then
			busybox swapoff /dev/block/zram0
			busybox swapoff /dev/block/zram1
			busybox swapoff /dev/block/zram2
			busybox swapoff /dev/block/zram3
			echo "1" > /sys/block/zram0/reset
			echo "1" > /sys/block/zram1/reset
			echo "1" > /sys/block/zram2/reset
			echo "1" > /sys/block/zram3/reset
			busybox mkswap /dev/block/zram0
			busybox swapon -p 2 /dev/block/zram0
		fi
		if [ "2" == "$3" ]; then
			busybox swapoff /dev/block/zram0
			busybox swapoff /dev/block/zram1
			busybox swapoff /dev/block/zram2
			busybox swapoff /dev/block/zram3
			echo "1" > /sys/block/zram0/reset
			echo "1" > /sys/block/zram1/reset
			echo "1" > /sys/block/zram2/reset
			echo "1" > /sys/block/zram3/reset
			busybox mkswap /dev/block/zram0
			busybox mkswap /dev/block/zram1
			busybox swapon -p 2 /dev/block/zram0
			busybox swapon -p 2 /dev/block/zram1
		fi
		if [ "4" == "$3" ]; then
			busybox swapoff /dev/block/zram0
			busybox swapoff /dev/block/zram1
			busybox swapoff /dev/block/zram2
			busybox swapoff /dev/block/zram3
			echo "1" > /sys/block/zram0/reset
			echo "1" > /sys/block/zram1/reset
			echo "1" > /sys/block/zram2/reset
			echo "1" > /sys/block/zram3/reset
			busybox mkswap /dev/block/zram0
			busybox mkswap /dev/block/zram1
			busybox mkswap /dev/block/zram2
			busybox mkswap /dev/block/zram3
			busybox swapon -p 2 /dev/block/zram0
			busybox swapon -p 2 /dev/block/zram1
			busybox swapon -p 2 /dev/block/zram2
			busybox swapon -p 2 /dev/block/zram3
		fi
		echo "80" > /proc/sys/vm/swappiness
	fi

	if [ "0" == "$2" ]; then
		busybox swapoff /dev/block/zram0
		busybox swapoff /dev/block/zram1
		busybox swapoff /dev/block/zram2
		busybox swapoff /dev/block/zram3
		echo "1" > /sys/block/zram0/reset
		echo "1" > /sys/block/zram1/reset
		echo "1" > /sys/block/zram2/reset
		echo "1" > /sys/block/zram3/reset
	fi
	exit 0
fi

if [ "apply_cifs" == "$1" ]; then
	if [ "1" == "$2" ]; then
		insmod $LIBPATH/cifs.ko
	fi

	if [ "0" == "$2" ]; then
		rmmod $LIBPATH/cifs.ko	
	fi
	exit 0
fi

if [ "apply_nfs" == "$1" ]; then
	if [ "1" == "$2" ]; then
		insmod $LIBPATH/sunrpc.ko
		insmod $LIBPATH/auth_rpcgss.ko
		insmod $LIBPATH/lockd.ko
		insmod $LIBPATH/nfs.ko
	fi

	if [ "0" == "$2" ]; then
		rmmod $LIBPATH/nfs.ko
		rmmod $LIBPATH/lockd.ko
		rmmod $LIBPATH/auth_rpcgss.ko
		rmmod $LIBPATH/sunrpc.ko
	fi
	exit 0
fi

if [ "apply_xbox" == "$1" ]; then
	if [ "1" == "$2" ]; then
		insmod $LIBPATH/xpad.ko
	fi

	if [ "0" == "$2" ]; then
		rmmod $LIBPATH/xpad.ko
	fi
	exit 0
fi

if [ "apply_exfat" == "$1" ]; then
	if [ "1" == "$2" ]; then
		insmod $LIBPATH/exfat_core.ko
		insmod $LIBPATH/exfat_fs.ko
	fi

	if [ "0" == "$2" ]; then
		rmmod $LIBPATH/exfat_fs.ko
		rmmod $LIBPATH/exfat_core.ko
	fi
	exit 0
fi

if [ "apply_ntfs" == "$1" ]; then
	if [ "1" == "$2" ]; then
		insmod $LIBPATH/ntfs.ko
	fi

	if [ "0" == "$2" ]; then
		rmmod $LIBPATH/ntfs.ko
	fi
	exit 0
fi

if [ "apply_ums" == "$1" ]; then
	if [ "1" == "$2" ]; then
		umount -l /mnt/extSdCard/
		/system/bin/setprop persist.sys.usb.config mass_storage,adb
		echo /dev/block/vold/179:17 > /sys/devices/platform/s3c-usbgadget/gadget/lun0/file
	fi

	if [ "0" == "$2" ]; then
		echo "" > /sys/devices/platform/s3c-usbgadget/gadget/lun0/file
		/system/bin/vold
		/system/bin/setprop persist.sys.usb.config mtp,adb
	fi
	exit 0
fi


# *******************
# Actions
# *******************

if [ "action_debug_info_file" == "$1" ]; then
	echo $(date) Full debug log file start > $2
	echo -e "\n============================================\n" >> $2

	echo -e "\n**** Boeffla-Kernel version\n" >> $2
	cat /proc/version >> $2

	echo -e "\n**** Firmware information\n" >> $2
	busybox grep ro.build.version /system/build.prop >> $2

	echo -e "\n============================================\n" >> $2

	echo -e "\n**** Boeffla-Kernel config\n" >> $2
	cat /sdcard/boeffla-kernel/boeffla-kernel.conf  >> $2

	echo -e "\n============================================\n" >> $2

	echo -e "\n**** Boeffla-Kernel log\n" >> $2
	cat /sdcard/boeffla-kernel-data/boeffla-kernel.log >> $2

	echo -e "\n**** Boeffla-Kernel log 1\n" >> $2
	cat /sdcard/boeffla-kernel-data/boeffla-kernel.log.1 >> $2

	echo -e "\n**** Boeffla-Kernel log 2\n" >> $2
	cat /sdcard/boeffla-kernel-data/boeffla-kernel.log.2 >> $2

	echo -e "\n**** Boeffla-Kernel log 3\n" >> $2
	cat /sdcard/boeffla-kernel-data/boeffla-kernel.log.3 >> $2

	echo -e "\n============================================\n" >> $2

	echo -e "\n**** Boeffla-Config app log\n" >> $2
	cat /sdcard/boeffla-kernel-data/bc.log >> $2

	echo -e "\n**** Boeffla-Config app log 1\n" >> $2
	cat /sdcard/boeffla-kernel-data/bc.log.1 >> $2

	echo -e "\n**** Boeffla-Config app log 2\n" >> $2
	cat /sdcard/boeffla-kernel-data/bc.log.2 >> $2

	echo -e "\n**** Boeffla-Config app log 3\n" >> $2
	cat /sdcard/boeffla-kernel-data/bc.log.3 >> $2

	echo -e "\n============================================\n" >> $2

	echo -e "\n**** boeffla_sound\n" >> $2
	cat /sys/class/misc/boeffla_sound/boeffla_sound >> $2

	echo -e "\n**** headphone_volume\n" >> $2
	cat /sys/class/misc/boeffla_sound/headphone_volume >> $2

	echo -e "\n**** speaker_volume\n" >> $2
	cat /sys/class/misc/boeffla_sound/speaker_volume >> $2

	echo -e "\n**** speaker_tuning\n" >> $2
	cat /sys/class/misc/boeffla_sound/speaker_tuning >> $2

	echo -e "\n**** privacy_mode\n" >> $2
	cat /sys/class/misc/boeffla_sound/privacy_mode >> $2

	echo -e "\n**** equalizer\n" >> $2
	cat /sys/class/misc/boeffla_sound/eq >> $2

	echo -e "\n**** eq_gains\n" >> $2
	cat /sys/class/misc/boeffla_sound/eq_gains >> $2

	echo -e "\n**** eq_gains_alt\n" >> $2
	cat /sys/class/misc/boeffla_sound/eq_gains_alt >> $2

	echo -e "\n**** eq_bands\n" >> $2
	cat /sys/class/misc/boeffla_sound/eq_bands >> $2

	echo -e "\n**** dac_direct\n" >> $2
	cat /sys/class/misc/boeffla_sound/dac_direct >> $2

	echo -e "\n**** dac_oversampling\n" >> $2
	cat /sys/class/misc/boeffla_sound/dac_oversampling >> $2

	echo -e "\n**** fll_tuning\n" >> $2
	cat /sys/class/misc/boeffla_sound/fll_tuning >> $2

	echo -e "\n**** stereo_expansion\n" >> $2
	cat /sys/class/misc/boeffla_sound/stereo_expansion >> $2

	echo -e "\n**** mono_downmix\n" >> $2
	cat /sys/class/misc/boeffla_sound/mono_downmix >> $2

	echo -e "\n**** mic_level_general\n" >> $2
	cat /sys/class/misc/boeffla_sound/mic_level_general >> $2

	echo -e "\n**** mic_level_call\n" >> $2
	cat /sys/class/misc/boeffla_sound/mic_level_call >> $2

	echo -e "\n**** debug_level\n" >> $2
	cat /sys/class/misc/boeffla_sound/debug_level >> $2

	echo -e "\n**** debug_info\n" >> $2
	cat /sys/class/misc/boeffla_sound/debug_info >> $2

	echo -e "\n**** version\n" >> $2
	cat /sys/class/misc/boeffla_sound/version >> $2

	echo "\n============================================\n" >> $2

	echo -e "\n**** Loaded modules:\n" >> $2
	lsmod >> $2

	echo -e "\n**** Max CPU frequency:\n" >> $2
	cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq >> $2

	echo -e "\n**** CPU undervolting:\n" >> $2
	cat /sys/devices/system/cpu/cpu0/cpufreq/UV_mV_table >> $2

	echo -e "\n**** GPU frequencies:\n" >> $2
	cat /sys/class/misc/gpu_clock_control/gpu_control >> $2

	echo -e "\n**** GPU undervolting:\n" >> $2
	cat /sys/class/misc/gpu_voltage_control/gpu_control >> $2

	echo -e "\n**** ASV level:\n" >> $2
	cat /sys/devices/system/cpu/cpu0/cpufreq/asv_level >> $2

	echo -e "\n**** Root:\n" >> $2
	ls /system/xbin/su >> $2
	ls /system/app/Superuser.apk >> $2

	echo -e "\n**** Busybox:\n" >> $2
	ls /sbin/busybox >> $2
	ls /system/bin/busybox >> $2
	ls /system/xbin/busybox >> $2

	echo -e "\n**** Mounts:\n" >> $2
	mount | busybox grep /data >> $2
	mount | busybox grep /cache >> $2

	echo -e "\n**** SD Card read ahead:\n" >> $2
	cat /sys/block/mmcblk0/bdi/read_ahead_kb >> $2
	cat /sys/block/mmcblk1/bdi/read_ahead_kb >> $2

	echo -e "\n**** Various kernel settings by config app:\n" >> $2
	echo -e "\n(gov prof, cpu volt prof, gpu freq prof, gpu volt prof, eq prof, mdnie over, sys tweaks, swapp over)\n" >> $2
	cat /dev/bk_governor_profile >> $2
	cat /dev/bk_cpu_voltages_profile >> $2
	cat /dev/bk_gpu_frequencies_profile >> $2
	cat /dev/bk_gpu_voltages_profile >> $2
	cat /dev/bk_eq_gains_profile >> $2
	cat /dev/bk_mdnie_overwrite >> $2
	cat /dev/bk_system_tweaks >> $2
	cat /dev/bk_swappiness_overwrite >> $2

	echo -e "\n**** Touch boost switch:\n" >> $2
	cat /sys/class/misc/touchboost_switch/touchboost_switch >> $2

	echo -e "\n**** Touch boost frequency:\n" >> $2
	cat /sys/class/misc/touchboost_switch/touchboost_freq >> $2

	echo -e "\n**** Touch wake:\n" >> $2
	cat /sys/class/misc/touchwake/enabled >> $2
	cat /sys/class/misc/touchwake/delay >> $2

	echo -e "\n**** Early suspend:\n" >> $2
	cat /sys/kernel/early_suspend/early_suspend_delay >> $2

	echo -e "\n**** Charging levels (ac/usb/wireless):\n" >> $2
	cat /sys/kernel/charge_levels/charge_level_ac >> $2
	cat /sys/kernel/charge_levels/charge_level_usb >> $2
	cat /sys/kernel/charge_levels/charge_level_wireless >> $2

	echo -e "\n**** Charging instable power / ignore safety margin:\n" >> $2
	cat /sys/kernel/charge_levels/ignore_unstable_power >> $2
	cat /sys/kernel/charge_levels/ignore_safety_margin >> $2

	echo -e "\n**** Governor:\n" >> $2
	cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor >> $2

	echo -e "\n**** Scheduler:\n" >> $2
	cat /sys/block/mmcblk0/queue/scheduler >> $2
	cat /sys/block/mmcblk1/queue/scheduler >> $2

	echo -e "\n**** Kernel Logger:\n" >> $2
	cat /sys/kernel/printk_mode/printk_mode >> $2

	echo -e "\n**** Android Logger:\n" >> $2
	cat /sys/kernel/logger_mode/logger_mode >> $2

	echo -e "\n**** Sharpness fix:\n" >> $2
	cat /sys/class/misc/mdnie_preset/mdnie_preset >> $2

	echo -e "\n**** LED fading:\n" >> $2
	cat /sys/class/sec/led/led_fade >> $2

	echo -e "\n**** LED intensity:\n" >> $2
	cat /sys/class/sec/led/led_intensity >> $2

	echo -e "\n**** LED speed:\n" >> $2
	cat /sys/class/sec/led/led_speed >> $2

	echo -e "\n**** LED slope:\n" >> $2
	cat /sys/class/sec/led/led_slope >> $2

	echo -e "\n**** zRam disk size:\n" >> $2
	cat /sys/block/zram0/disksize >> $2
	cat /sys/block/zram1/disksize >> $2
	cat /sys/block/zram2/disksize >> $2
	cat /sys/block/zram3/disksize >> $2

	echo -e "\n**** zRam compressed data size:\n" >> $2
	cat /sys/block/zram0/compr_data_size >> $2
	cat /sys/block/zram1/compr_data_size >> $2
	cat /sys/block/zram2/compr_data_size >> $2
	cat /sys/block/zram3/compr_data_size >> $2

	echo -e "\n**** zRam original data size:\n" >> $2
	cat /sys/block/zram0/orig_data_size >> $2
	cat /sys/block/zram1/orig_data_size >> $2
	cat /sys/block/zram2/orig_data_size >> $2
	cat /sys/block/zram3/orig_data_size >> $2

	echo -e "\n**** Uptime:\n" >> $2
	cat /proc/uptime >> $2

	echo -e "\n**** Frequency usage table:\n" >> $2
	cat /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state >> $2

	echo -e "\n**** Memory:\n" >> $2
	busybox free -m >> $2

	echo -e "\n**** Meminfo:\n" >> $2
	cat /proc/meminfo >> $2

	echo -e "\n**** Swap:\n" >> $2
	cat /proc/swaps >> $2

	echo -e "\n**** Low memory killer:\n" >> $2
	cat /sys/module/lowmemorykiller/parameters/minfree >> $2

	echo -e "\n**** Swappiness:\n" >> $2
	cat /proc/sys/vm/swappiness >> $2

	echo -e "\n**** Storage:\n" >> $2
	busybox df >> $2

	echo -e "\n**** Mounts:\n" >> $2
	mount >> $2

	echo -e "\n**** pegasusq tuneables\n" >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_1_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_1_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_4_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_4_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/cpu_down_rate >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/cpu_up_rate >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/up_threshold >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/freq_step >> $2

	echo -e "\n**** zzmoove tuneables\n" >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate_sleep_multiplier >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_factor >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_max_momentum >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_momentum_sensitivity >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/up_threshold >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_sleep >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/smooth_up >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/smooth_up_sleep >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug1 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug2 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug3 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/down_threshold >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_sleep >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug1 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug2 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug3 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq1 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq2 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug_freq3 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq1 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq2 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug_freq3 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/hotplug_block_cycles >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/hotplug_idle_threshold >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/disable_hotplug_sleep >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/disable_hotplug >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/hotplug_sleep >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/freq_step >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/freq_step_sleep >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/freq_limit >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/freq_limit_sleep >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling_sleep >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/early_demand >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/grad_up_threshold >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/ignore_nice_load >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_enable >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_cores >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_up_delay >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_down_delay >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_freq >> $2

	echo -e "\n**** lulzactiveq tuneables\n" >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/cpu_down_rate >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/cpu_up_rate >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/debug_mode >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/dec_cpu_load >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/down_sample_time >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/dvfs_debug >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/freq_table >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/hispeed_freq >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_1_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_2_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_2_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_3_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_3_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_4_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_lock >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_1_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_2_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_2_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_3_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_3_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_4_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_sampling_rate >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/ignore_nice_load >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/inc_cpu_load >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/max_cpu_lock >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/min_cpu_lock >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/pump_down_step >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/pump_up_step >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/screen_off_min_step >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/up_nr_cpus >> $2
	cat /sys/devices/system/cpu/cpufreq/lulzactiveq/up_sample_time >> $2

	echo -e "\n**** ondemand tuneables\n" >> $2
	cat /sys/devices/system/cpu/cpufreq/ondemand/down_differential >> $2
	cat /sys/devices/system/cpu/cpufreq/ondemand/freq_step >> $2
	cat /sys/devices/system/cpu/cpufreq/ondemand/ignore_nice_load >> $2
	cat /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy >> $2
	cat /sys/devices/system/cpu/cpufreq/ondemand/powersave_bias >> $2
	cat /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor >> $2
	cat /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate >> $2
	cat /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate_min >> $2
	cat /sys/devices/system/cpu/cpufreq/ondemand/up_threshold >> $2

	echo -e "\n============================================\n" >> $2

	echo -e "\n**** /data/app folder\n" >> $2
	ls -l /data/app >> $2

	echo -e "\n**** /system/app folder\n" >> $2
	ls -l /system/app >> $2

	echo -e "\n============================================\n" >> $2

	echo -e "\n**** /system/etc/init.d folder\n" >> $2
	ls -l /system/etc/init.d >> $2

	echo -e "\n**** /etc/init.d folder\n" >> $2
	ls -l /etc/init.d >> $2

	echo -e "\n**** /data/init.d folder\n" >> $2
	ls -l /data/init.d >> $2

	echo -e "\n============================================\n" >> $2

	echo -e "\n**** last_kmsg\n" >> $2
	cat /proc/last_kmsg  >> $2

	echo -e "\n============================================\n" >> $2

	echo -e "\n**** dmesg\n" >> $2
	dmesg  >> $2

	echo -e "\n============================================\n" >> $2
	echo $(date) Full debug log file end >> $2
	exit 0
fi

if [ "action_reboot" == "$1" ]; then
	busybox sync
	busybox sleep 1s
	/system/bin/reboot
	exit 0
fi

if [ "action_reboot_cwm" == "$1" ]; then
	busybox sync
	busybox sleep 1s
	/system/bin/reboot recovery
	exit 0
fi

if [ "action_reboot_download" == "$1" ]; then
	busybox sync
	busybox sleep 1s
	/system/bin/reboot download
	exit 0
fi

if [ "action_wipe_caches_reboot" == "$1" ]; then
	busybox rm -rf /cache/*
	busybox rm -rf /data/dalvik-cache/*
	busybox sync
	busybox sleep 1s
	/system/bin/reboot
	exit 0
fi

if [ "action_wipe_clipboard_cache" == "$1" ]; then
	busybox rm -rf /data/clipboard/*
	busybox sync
	exit 0
fi

if [ "action_clean_initd" == "$1" ]; then
	busybox tar cvz -f $2 /system/etc/init.d
	mount -o remount,rw -t ext4 /dev/block/mmcblk0p13 /system
	busybox rm /system/etc/init.d/*
	mount -o remount,ro -t ext4 /dev/block/mmcblk0p13 /system
	exit 0
fi

if [ "action_fix_permissions" == "$1" ]; then
	busybox sh /res/bc/fix_permissions
	busybox sync
	exit 0
fi

if [ "action_fstrim" == "$1" ]; then
	echo -e "Trim /data"
	/res/bc/fstrim -v /data
	echo -e ""
	echo -e "Trim /cache"
	/res/bc/fstrim -v /cache
	echo -e ""
	echo -e "Trim /system"
	/res/bc/fstrim -v /system
	echo -e ""
	busybox sync
	exit 0
fi


if [ "flash_kernel" == "$1" ]; then
	busybox dd if=$2 of=/dev/block/mmcblk0p8
	exit 0
fi

if [ "archive_kernel" == "$1" ]; then
	IMGPATH=$2
	cd ${IMGPATH%/*}
	busybox rm $3.tar
	busybox rm $3.tar.md5
	busybox tar cvf $3.tar ${IMGPATH##*/}
	busybox md5sum $3.tar >> $3.tar
	busybox mv $3.tar $3.tar.md5
	busybox chmod 666 $3.tar.md5
	busybox rm $2
	exit 0
fi

if [ "extract_kernel" == "$1" ]; then
	busybox tar -xvf $2 -C $3
	exit 0
fi

if [ "flash_recovery" == "$1" ]; then
	busybox dd if=$2 of=/dev/block/mmcblk0p9
	exit 0
fi

if [ "extract_recovery" == "$1" ]; then
	busybox tar -xvf $2 -C $3
	exit 0
fi

if [ "flash_modem" == "$1" ]; then
	busybox dd if=$2 of=/dev/block/mmcblk0p10
	exit 0
fi

if [ "extract_modem" == "$1" ]; then
	busybox tar -xvf $2 -C $3
	exit 0
fi

if [ "flash_cm_kernel" == "$1" ]; then
	busybox dd if=$2/boot.img of=/dev/block/mmcblk0p8
	mount -o remount,rw -t ext4 /dev/block/mmcblk0p13 /system
	busybox rm -f /system/lib/modules/*
	busybox cp $2/system/lib/modules/* /system/lib/modules
	busybox chmod 644 /system/lib/modules/*
	mount -o remount,ro -t ext4 /dev/block/mmcblk0p13 /system
	exit 0
fi

if [ "extract_cm_kernel" == "$1" ]; then
	busybox unzip $2 -d $3
	exit 0
fi
