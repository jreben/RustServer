#!/bin/bash
# LGSM core_messages.sh function
# Author: Daniel Gibbs
# Website: https://gameservermanagers.com
# Description: Defines on-screen messages such as [  OK  ] and how script logs look.

# nl: new line: message is following by a new line
# eol: end of line: message is placed at the end of the current line

if [ "${ansi}" != "off" ]; then
	# echo colors
	default="\e[0m"
	red="\e[31m"
	green="\e[32m"
	yellow="\e[33m"
	lightyellow="\e[93m"
	blue="\e[34m"
	lightblue="\e[94m"
	magenta="\e[35m"
	cyan="\e[36m"
	# carriage return & erase to end of line
	creeol="\r\033[K"
fi

# Log display
########################
## Feb 28 14:56:58 ut99-server: Monitor:
fn_script_log(){
	if [ -d "${scriptlogdir}" ]; then
		if [ -n "${commandname}" ]; then
			echo -e "$(date '+%b %d %H:%M:%S') ${servicename}: ${commandname}: ${1}" >> "${scriptlog}"
		else
			echo -e "$(date '+%b %d %H:%M:%S') ${servicename}: ${1}" >> "${scriptlog}"
		fi
	fi
}

## Feb 28 14:56:58 ut99-server: Monitor: PASS:
fn_script_log_pass(){
	if [ -d "${scriptlogdir}" ]; then
		if [ -n "${commandname}" ]; then
			echo -e "$(date '+%b %d %H:%M:%S') ${servicename}: ${commandname}: PASS: ${1}" >> "${scriptlog}"
		else
			echo -e "$(date '+%b %d %H:%M:%S') ${servicename}: PASS: ${1}" >> "${scriptlog}"
		fi
	fi
	exitcode=0
}

## Feb 28 14:56:58 ut99-server: Monitor: FATAL:
fn_script_log_fatal(){
	if [ -d "${scriptlogdir}" ]; then
		if [ -n "${commandname}" ]; then
			echo -e "$(date '+%b %d %H:%M:%S') ${servicename}: ${commandname}: FATAL: ${1}" >> "${scriptlog}"
		else
			echo -e "$(date '+%b %d %H:%M:%S') ${servicename}: FATAL: ${1}" >> "${scriptlog}"
		fi
	fi
	exitcode=1
}

## Feb 28 14:56:58 ut99-server: Monitor: ERROR:
fn_script_log_error(){
	if [ -d "${scriptlogdir}" ]; then
		if [ -n "${commandname}" ]; then
			echo -e "$(date '+%b %d %H:%M:%S') ${servicename}: ${commandname}: ERROR: ${1}" >> "${scriptlog}"
		else
			echo -e "$(date '+%b %d %H:%M:%S') ${servicename}: ERROR: ${1}" >> "${scriptlog}"
		fi
	fi
	exitcode=2
}

## Feb 28 14:56:58 ut99-server: Monitor: WARN:
fn_script_log_warn(){
	if [ -d "${scriptlogdir}" ]; then
		if [ -n "${commandname}" ]; then
			echo -e "$(date '+%b %d %H:%M:%S') ${servicename}: ${commandname}: WARN: ${1}" >> "${scriptlog}"
		else
			echo -e "$(date '+%b %d %H:%M:%S') ${servicename}: WARN: ${1}" >> "${scriptlog}"
		fi
	fi
	exitcode=3
}

## Feb 28 14:56:58 ut99-server: Monitor: INFO:
fn_script_log_info(){
	if [ -d "${scriptlogdir}" ]; then
		if [ -n "${commandname}" ]; then
			echo -e "$(date '+%b %d %H:%M:%S') ${servicename}: ${commandname}: INFO: ${1}" >> "${scriptlog}"
		else
			echo -e "$(date '+%b %d %H:%M:%S') ${servicename}: INFO: ${1}" >> "${scriptlog}"
		fi
	fi
}

# On-Screen - Automated functions
##################################

# [ .... ]
fn_print_dots(){
	if [ -n "${commandaction}" ]; then
		echo -en "${creeol}[ .... ] ${commandaction} ${servicename}: $@"
	else
		echo -en "${creeol}[ .... ] $@"
	fi
}

fn_print_dots_nl(){
	if [ -n "${commandaction}" ]; then
		echo -e "${creeol}[ .... ] ${commandaction} ${servicename}: $@"
	else
		echo -e "${creeol}[ .... ] $@"
	fi
	sleep 0.5
	echo -en "\n"
}

# [  OK  ]
fn_print_ok(){
	if [ -n "${commandaction}" ]; then
		echo -en "${creeol}[${green}  OK  ${default}] ${commandaction} ${servicename}: $@"
	else
		echo -en "${creeol}[${green}  OK  ${default}] $@"
	fi
}

fn_print_ok_nl(){
	if [ -n "${commandaction}" ]; then
		echo -en "${creeol}[${green}  OK  ${default}] ${commandaction} ${servicename}: $@"
	else
		echo -en "${creeol}[${green}  OK  ${default}] $@"
	fi
	sleep 0.5
	echo -en "\n"
}

# [ FAIL ]
fn_print_fail(){
	if [ -n "${commandaction}" ]; then
		echo -en "${creeol}[${red} FAIL ${default}] ${commandaction} ${servicename}: $@"
	else
		echo -en "${creeol}[${red} FAIL ${default}] $@"
	fi
}

fn_print_fail_nl(){
	if [ -n "${commandaction}" ]; then
		echo -en "${creeol}[${red} FAIL ${default}] ${commandaction} ${servicename}: $@"
	else
		echo -en "${creeol}[${red} FAIL ${default}] $@"
	fi
	sleep 0.5
	echo -en "\n"
}

# [ ERROR ]
fn_print_error(){
	if [ -n "${commandaction}" ]; then
		echo -en "${creeol}[${red}ERROR ${default}] ${commandaction} ${servicename}: $@"
	else
		echo -en "${creeol}[${red}ERROR ${default}] $@"
	fi
}

fn_print_error_nl(){
	if [ -n "${commandaction}" ]; then
		echo -en "${creeol}[${red}ERROR!${default}] ${commandaction} ${servicename}: $@"
	else
		echo -en "${creeol}[${red}ERROR!${default}] $@"
	fi
	sleep 0.5
	echo -en "\n"
}

# [ WARN ]
fn_print_warn(){
	if [ -n "${commandaction}" ]; then
		echo -en "${creeol}[${yellow} WARN ${default}] ${commandaction} ${servicename}: $@"
	else
		echo -en "${creeol}[${yellow} WARN ${default}] $@"
	fi
}

fn_print_warn_nl(){
	if [ -n "${commandaction}" ]; then
		echo -en "${creeol}[${yellow} WARN ${default}] ${commandaction} ${servicename}: $@"
	else
		echo -en "${creeol}[${yellow} WARN ${default}] $@"
	fi
	sleep 0.5
	echo -en "\n"
}

# [ INFO ]
fn_print_info(){
	if [ -n "${commandaction}" ]; then
		echo -en "${creeol}[${cyan} INFO ${default}] ${commandaction} ${servicename}: $@"
	else
		echo -en "${creeol}[${cyan} INFO ${default}] $@"
	fi
}

fn_print_info_nl(){
	if [ -n "${commandaction}" ]; then
		echo -en "${creeol}[${cyan} INFO ${default}] ${commandaction} ${servicename}: $@"
	else
		echo -en "${creeol}[${cyan} INFO ${default}] $@"
	fi
	sleep 0.5
	echo -en "\n"
}

# On-Screen - Interactive messages
##################################

# No More Room in Hell Debug
# =================================
fn_print_header(){
	echo -e ""
	echo -e "${gamename} ${commandaction}"
	echo -e "=================================${default}"
	echo -e ""
}

# Complete!
fn_print_complete(){
	echo -en "${green}Complete!${default} $@"
}

fn_print_complete_nl(){
	echo -e "${green}Complete!${default} $@"
}

# Failure!
fn_print_failure(){
	echo -en "${red}Failure!${default} $@"
}

fn_print_failure_nl(){
	echo -e "${red}Failure!${default} $@"
}

# Error!
fn_print_error2(){
	echo -en "${red}Error!${default} $@"
}

fn_print_error2_nl(){
	echo -e "${red}Error!${default} $@"
}

# Warning!
fn_print_warning(){
	echo -en "${yellow}Warning!${default} $@"
}

fn_print_warning_nl(){
	echo -e "${yellow}Warning!${default} $@"
}

# Information!
fn_print_information(){
	echo -en "${cyan}Information!${default} $@"
}

fn_print_information_nl(){
	echo -e "${cyan}Information!${default} $@"
}

# On-Screen End of Line
##################################

# OK
fn_print_ok_eol(){
	echo -en "${green}OK${default}"
}

fn_print_ok_eol_nl(){
	echo -e "${green}OK${default}"
}

# FAIL
fn_print_fail_eol(){
	echo -en "${red}FAIL${default}"
}

fn_print_fail_eol_nl(){
	echo -e "${red}FAIL${default}"
}

# WARN
fn_print_warn_eol(){
	echo -en "${red}FAIL${default}"
}

fn_print_warn_eol_nl(){
	echo -e "${red}FAIL${default}"
}

# INFO
fn_print_info_eol(){
	echo -en "${red}FAIL${default}"
}

fn_print_info_eol_nl(){
	echo -e "${red}FAIL${default}"
}

# QUERYING
fn_print_querying_eol(){
	echo -en "${cyan}QUERYING${default}"
}

fn_print_querying_eol_nl(){
	echo -e "${cyan}QUERYING${default}"
}

# CHECKING
fn_print_checking_eol(){
	echo -en "${cyan}CHECKING${default}"
}

fn_print_checking_eol_nl(){
	echo -e "${cyan}CHECKING${default}"
}

# CANCELED
fn_print_canceled_eol(){
	echo -en "${yellow}CANCELED${default}"
}

fn_print_canceled_eol_nl(){
	echo -e "${yellow}CANCELED${default}"
}

# REMOVED
fn_print_removed_eol(){
	echo -en "${red}REMOVED${default}"
}

fn_print_removed_eol_nl(){
	echo -e "${red}REMOVED${default}"
}

# UPDATE
fn_print_update_eol(){
	echo -en "${cyan}UPDATE${default}"
}

fn_print_update_eol_nl(){
	echo -e "${cyan}UPDATE${default}"
}
