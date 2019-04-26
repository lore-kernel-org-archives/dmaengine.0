Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,15/15] arm64: defconfig: Enable SDMA on i.mx8mq/8mm
From: Robin Gong <yibin.gong@nxp.com>
Message-Id: <1556265512-9130-16-git-send-email-yibin.gong@nxp.com>
Date: Fri, 26 Apr 2019 08:06:32 +0000
To: "broonie@kernel.org" <broonie@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "plyatov@gmail.com" <plyatov@gmail.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <dmaengine.vger.kernel.org>

RW5hYmxlIFNETUEgc3VwcG9ydCBvbiBpLm14OG1xLzhtbSBjaGlwcywgaW5jbHVkaW5nIGVuYWJs
aW5nDQpDT05GSUdfRldfTE9BREVSX1VTRVJfSEVMUEVSL0NPTkZJR19GV19MT0FERVJfVVNFUl9I
RUxQRVJfRkFMTEJBQ0sNCmZvciBmaXJtd2FyZSBsb2FkZWQgYnkgdWRldi4NCg0KU2lnbmVkLW9m
Zi1ieTogUm9iaW4gR29uZyA8eWliaW4uZ29uZ0BueHAuY29tPg0KLS0tDQogYXJjaC9hcm02NC9j
b25maWdzL2RlZmNvbmZpZyB8IDMgKysrDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQ0KDQotLSANCjIuNy40CgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZp
ZyBiL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcNCmluZGV4IDE3ZGFhOTcuLjcwODE4MTcg
MTAwNjQ0DQotLS0gYS9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnDQorKysgYi9hcmNoL2Fy
bTY0L2NvbmZpZ3MvZGVmY29uZmlnDQpAQCAtMjAzLDYgKzIwMyw4IEBAIENPTkZJR19ORVRfOVBf
VklSVElPPXkNCiBDT05GSUdfVUVWRU5UX0hFTFBFUl9QQVRIPSIvc2Jpbi9ob3RwbHVnIg0KIENP
TkZJR19ERVZUTVBGUz15DQogQ09ORklHX0RFVlRNUEZTX01PVU5UPXkNCitDT05GSUdfRldfTE9B
REVSX1VTRVJfSEVMUEVSPXkNCitDT05GSUdfRldfTE9BREVSX1VTRVJfSEVMUEVSX0ZBTExCQUNL
PXkNCiBDT05GSUdfRE1BX0NNQT15DQogQ09ORklHX0NNQV9TSVpFX01CWVRFUz0zMg0KIENPTkZJ
R19ISVNJTElDT05fTFBDPXkNCkBAIC02MzUsNiArNjM3LDcgQEAgQ09ORklHX1JUQ19EUlZfSU1Y
X1NDPW0NCiBDT05GSUdfUlRDX0RSVl9YR0VORT15DQogQ09ORklHX0RNQURFVklDRVM9eQ0KIENP
TkZJR19ETUFfQkNNMjgzNT1tDQorQ09ORklHX0lNWF9TRE1BPXkNCiBDT05GSUdfSzNfRE1BPXkN
CiBDT05GSUdfTVZfWE9SX1YyPXkNCiBDT05GSUdfUEwzMzBfRE1BPXkNCg==
