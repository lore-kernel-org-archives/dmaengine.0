Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,01/15] Revert "ARM: dts: imx6q: Use correct SDMA script for SPI5 core"
From: Robin Gong <yibin.gong@nxp.com>
Message-Id: <1556265512-9130-2-git-send-email-yibin.gong@nxp.com>
Date: Fri, 26 Apr 2019 08:05:10 +0000
To: "broonie@kernel.org" <broonie@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "plyatov@gmail.com" <plyatov@gmail.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <dmaengine.vger.kernel.org>

VGhlcmUgYXJlIHR3byB3YXlzIGZvciBTRE1BIGFjY2Vzc2luZyBTUEJBIGRldmljZXM6IG9uZSBp
cyBTRE1BLT5BSVBTDQotPlNQQkEobWFzdGVyQSBwb3J0KSwgYW5vdGhlciBpcyBTRE1BLT5TUEJB
KG1hc3RlckMgcG9ydCkuIFBsZWFzZSByZWZlcg0KdG8gdGhlICdGaWd1cmUgNTgtMS4gaS5NWCA2
RHVhbC82UXVhZCBTUEJBIGNvbm5lY3Rpdml0eScgb2YgaS5teDZEUQ0KUmVmZXJlbmNlIE1hbnVh
bC4gU0RNQSBwcm92aWRlIHRoZSBjb3JyZXNwb25kaW5nIGFwcF8yX21jdS9tY3VfMl9hcHAgYW5k
DQpzaHBfMl9tY3UvbWN1XzJfc2hwIHNjcmlwdCBmb3Igc3VjaCB0d28gb3B0aW9ucy4gU28gYm90
aCBBSVBTIGFuZCBTUEJBDQpzY3JpcHRzIHNob3VsZCBrZWVwIHRoZSBzYW1lIGJlaGF2aW91ciwg
dGhlIGlzc3VlIG9ubHkgY2F1Z2h0IGluIEFJUFMNCnNjcmlwdCBzb3VuZHMgbm90IHNvbGlkZS4N
CiAgVGhlIGlzc3VlIGlzIG1vcmUgbGlrZWx5IGFzIHRoZSBlY3NwaSBlcnJhdGENCkVSUjAwOTE2
NShodHRwOi8vd3d3Lm54cC5jb20vZG9jcy9lbi9lcnJhdGEvSU1YNkRRQ0UucGRmKToNCmVDU1BJ
OiBUWEZJRk8gZW1wdHkgZmxhZyBnbGl0Y2ggY2FuIGNhdXNlIHRoZSBjdXJyZW50IEZJRk8gdHJh
bnNmZXIgdG8NCiAgICAgICBiZSBzZW50IHR3aWNlDQpTbyByZXZlcnQgY29tbWl0ICdkZjA3MTAx
ZTFjNGEnIGZpcnN0bHkuDQoNClNpZ25lZC1vZmYtYnk6IFJvYmluIEdvbmcgPHlpYmluLmdvbmdA
bnhwLmNvbT4NCi0tLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDZxLmR0c2kgfCAyICstDQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCi0tIA0KMi43LjQK
CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXg2cS5kdHNpIGIvYXJjaC9hcm0vYm9v
dC9kdHMvaW14NnEuZHRzaQ0KaW5kZXggZDAzOGY0MS4uNzE3NTg5OCAxMDA2NDQNCi0tLSBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2lteDZxLmR0c2kNCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZx
LmR0c2kNCkBAIC0xNzIsNyArMTcyLDcgQEANCiAJCQkJCWNsb2NrcyA9IDwmY2xrcyBJTVg2UV9D
TEtfRUNTUEk1PiwNCiAJCQkJCQkgPCZjbGtzIElNWDZRX0NMS19FQ1NQSTU+Ow0KIAkJCQkJY2xv
Y2stbmFtZXMgPSAiaXBnIiwgInBlciI7DQotCQkJCQlkbWFzID0gPCZzZG1hIDExIDggMT4sIDwm
c2RtYSAxMiA4IDI+Ow0KKwkJCQkJZG1hcyA9IDwmc2RtYSAxMSA3IDE+LCA8JnNkbWEgMTIgNyAy
PjsNCiAJCQkJCWRtYS1uYW1lcyA9ICJyeCIsICJ0eCI7DQogCQkJCQlzdGF0dXMgPSAiZGlzYWJs
ZWQiOw0KIAkJCQl9Ow0K
