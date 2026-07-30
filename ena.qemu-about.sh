#!/bin/bash

if [[ "${0}" != "${BASH_SOURCE[0]}" ]]; then
    echo -e "[EXECUTE ERROR]: Correct execute method is \"bash ${0}\""
    return 1 &>/dev/null
fi

main() {
    sudo systemctl disable --now libvirtd
    sudo systemctl disable --now virtlogd
    return 0
}

main
exit 0
