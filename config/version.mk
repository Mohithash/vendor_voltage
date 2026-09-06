# Copyright (C) 2025 VoltageOS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ANDROID_VERSION := 17
VOLTAGEVERSION := 6.1

VOLTAGE_BUILD_TYPE ?= UNOFFICIAL
VOLTAGE_GPG_KEY :=
VOLTAGE_GPG_UID :=
VOLTAGE_DATE_YEAR := $(shell date -u +%Y)
VOLTAGE_DATE_MONTH := $(shell date -u +%m)
VOLTAGE_DATE_DAY := $(shell date -u +%d)
VOLTAGE_DATE_HOUR := $(shell date -u +%H)
VOLTAGE_DATE_MINUTE := $(shell date -u +%M)
VOLTAGE_BUILD_DATE := $(VOLTAGE_DATE_YEAR)$(VOLTAGE_DATE_MONTH)$(VOLTAGE_DATE_DAY)-$(VOLTAGE_DATE_HOUR)$(VOLTAGE_DATE_MINUTE)
TARGET_PRODUCT_SHORT := $(subst voltage_,,$(VOLTAGE_BUILD))

# BestROM official builds are the maintainer's own: they are produced from the
# maintainer's build environment with BESTROM_OFFICIAL=true exported. The
# VoltageOS gate (their downloaded device list plus a GPG key in the local
# keyring) does not apply to this ROM.
ifeq ($(BESTROM_OFFICIAL),true)
  VOLTAGE_BUILD_TYPE := OFFICIAL
else
  VOLTAGE_BUILD_TYPE := UNOFFICIAL
endif

VOLTAGE_VERSION := $(VOLTAGEVERSION)-$(VOLTAGE_BUILD)-$(VOLTAGE_BUILD_DATE)-$(VOLTAGE_BUILD_TYPE)
VOLTAGE_MOD_VERSION :=$(ANDROID_VERSION)-$(VOLTAGEVERSION)
VOLTAGE_DISPLAY_VERSION := BestROM-$(VOLTAGEVERSION)-$(VOLTAGE_BUILD_TYPE)
VOLTAGE_DISPLAY_BUILDTYPE := $(VOLTAGE_BUILD_TYPE)
VOLTAGE_FINGERPRINT := BestROM/$(VOLTAGE_MOD_VERSION)/$(TARGET_PRODUCT_SHORT)/$(VOLTAGE_BUILD_DATE)
VOLTAGE_PLATFORM_RELEASE_OR_CODENAME := 17.0

# Voltageos System Version
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.bestrom.build.status=$(VOLTAGE_BUILD_TYPE) \
    ro.bestrom.platform_release_or_codename=$(VOLTAGE_PLATFORM_RELEASE_OR_CODENAME) \
    org.bestrom.version=$(VOLTAGEVERSION) \
    ro.bestrom.maintainer.gpg_key=$(VOLTAGE_GPG_KEY) \
    ro.bestrom.maintainer.gpg_uid="$(VOLTAGE_GPG_UID)"
