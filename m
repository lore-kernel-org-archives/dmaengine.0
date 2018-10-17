Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [[PATCH] 2/9] Defconfig-changes-for-DMA-UART-of-AST2500
From: "sudheer.v" <open.sudheer@gmail.com>
Message-Id: <1539749466-3912-3-git-send-email-open.sudheer@gmail.com>
Date: Wed, 17 Oct 2018 09:40:59 +0530
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Russell King <linux@armlinux.org.uk>, Dan Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Michael Moese <mmoese@suse.de>, Hendrik Brueckner <brueckner@linux.vnet.ibm.com>, Kate Stewart <kstewart@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Cc: "sudheer.v" <open.sudheer@gmail.com>, Sudheer V <sudheer.veliseti@aspeedtech.com>, ShivahShankar Shakarnarayan rao <shivahshankar.shankarnarayanrao@aspeedtech.com>
List-ID: <dmaengine.vger.kernel.org>

U2lnbmVkLW9mZi1ieTogc3VkaGVlci52IDxvcGVuLnN1ZGhlZXJAZ21haWwuY29tPgotLS0KIGFy
Y2gvYXJtL2NvbmZpZ3MvYXNwZWVkX2c1X2RlZmNvbmZpZyB8IDYgKysrKy0tCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2NvbmZpZ3MvYXNwZWVkX2c1X2RlZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3MvYXNwZWVk
X2c1X2RlZmNvbmZpZwppbmRleCBiN2Y4ZmExLi4yNTgxM2I1IDEwMDY0NAotLS0gYS9hcmNoL2Fy
bS9jb25maWdzL2FzcGVlZF9nNV9kZWZjb25maWcKKysrIGIvYXJjaC9hcm0vY29uZmlncy9hc3Bl
ZWRfZzVfZGVmY29uZmlnCkBAIC0xMzIsOCArMTMyLDggQEAgQ09ORklHX0tFWUJPQVJEX0dQSU9f
UE9MTEVEPXkKIENPTkZJR19TRVJJQUxfODI1MD15CiAjIENPTkZJR19TRVJJQUxfODI1MF9ERVBS
RUNBVEVEX09QVElPTlMgaXMgbm90IHNldAogQ09ORklHX1NFUklBTF84MjUwX0NPTlNPTEU9eQot
Q09ORklHX1NFUklBTF84MjUwX05SX1VBUlRTPTYKLUNPTkZJR19TRVJJQUxfODI1MF9SVU5USU1F
X1VBUlRTPTYKK0NPTkZJR19TRVJJQUxfODI1MF9OUl9VQVJUUz0xCitDT05GSUdfU0VSSUFMXzgy
NTBfUlVOVElNRV9VQVJUUz0xCiBDT05GSUdfU0VSSUFMXzgyNTBfRVhURU5ERUQ9eQogQ09ORklH
X1NFUklBTF84MjUwX0FTUEVFRF9WVUFSVD15CiBDT05GSUdfU0VSSUFMXzgyNTBfU0hBUkVfSVJR
PXkKQEAgLTIxMSw2ICsyMTEsOCBAQCBDT05GSUdfUlRDX0NMQVNTPXkKIENPTkZJR19SVENfRFJW
X0RTMTMwNz15CiBDT05GSUdfUlRDX0RSVl9QQ0Y4NTIzPXkKIENPTkZJR19SVENfRFJWX1JWODgw
Mz15CitDT05GSUdfRE1BREVWSUNFUz15CitDT05GSUdfQVNUX1VBUlRfU0RNQT15CiAjIENPTkZJ
R19WSVJUSU9fTUVOVSBpcyBub3Qgc2V0CiAjIENPTkZJR19JT01NVV9TVVBQT1JUIGlzIG5vdCBz
ZXQKIENPTkZJR19JSU89eQo=
