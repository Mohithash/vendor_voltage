#!/sbin/sh
#
# ADDOND_VERSION=2
#
# /system/addon.d/50-voltage.sh
# During an upgrade this script backs up files listed below, /system is
# formatted and reinstalled, then the files are restored.
#
# /system/etc/hosts is deliberately NOT in the list. BestROM ships a baked
# blocklist there through the nullroute_etc_hosts module, and restoring the
# pre-OTA copy over it would silently revert the blocklist for every build
# after this one - passing every check run today and failing in a month.
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
