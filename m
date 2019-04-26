Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,04/15] dmaengine: imx-sdma: remove dupilicated sdma_load_context
From: Robin Gong <yibin.gong@nxp.com>
Message-Id: <1556265512-9130-5-git-send-email-yibin.gong@nxp.com>
Date: Fri, 26 Apr 2019 08:05:28 +0000
To: "broonie@kernel.org" <broonie@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "plyatov@gmail.com" <plyatov@gmail.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <dmaengine.vger.kernel.org>

U2luY2Ugc2RtYV90cmFuc2Zlcl9pbml0KCkgd2lsbCBkbyBzZG1hX2xvYWRfY29udGV4dCBiZWZv
cmUgYW55DQpzZG1hIHRyYW5zZmVyLCBubyBuZWVkIG9uY2UgbW9yZSBpbiBzZG1hX2NvbmZpZ19j
aGFubmVsKCkuDQoNClNpZ25lZC1vZmYtYnk6IFJvYmluIEdvbmcgPHlpYmluLmdvbmdAbnhwLmNv
bT4NCi0tLQ0KIGRyaXZlcnMvZG1hL2lteC1zZG1hLmMgfCA1ICstLS0tDQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQ0KDQotLSANCjIuNy40CgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9kbWEvaW14LXNkbWEuYyBiL2RyaXZlcnMvZG1hL2lteC1zZG1hLmMNCmlu
ZGV4IDQwN2E1NmUuLjg2YTMxYjQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2RtYS9pbXgtc2RtYS5j
DQorKysgYi9kcml2ZXJzL2RtYS9pbXgtc2RtYS5jDQpAQCAtMTEzNCw3ICsxMTM0LDYgQEAgc3Rh
dGljIHZvaWQgc2RtYV9zZXRfd2F0ZXJtYXJrbGV2ZWxfZm9yX3AycChzdHJ1Y3Qgc2RtYV9jaGFu
bmVsICpzZG1hYykNCiBzdGF0aWMgaW50IHNkbWFfY29uZmlnX2NoYW5uZWwoc3RydWN0IGRtYV9j
aGFuICpjaGFuKQ0KIHsNCiAJc3RydWN0IHNkbWFfY2hhbm5lbCAqc2RtYWMgPSB0b19zZG1hX2No
YW4oY2hhbik7DQotCWludCByZXQ7DQogDQogCXNkbWFfZGlzYWJsZV9jaGFubmVsKGNoYW4pOw0K
IA0KQEAgLTExNzQsOSArMTE3Myw3IEBAIHN0YXRpYyBpbnQgc2RtYV9jb25maWdfY2hhbm5lbChz
dHJ1Y3QgZG1hX2NoYW4gKmNoYW4pDQogCQlzZG1hYy0+d2F0ZXJtYXJrX2xldmVsID0gMDsgLyog
RklYTUU6IE0zX0JBU0VfQUREUkVTUyAqLw0KIAl9DQogDQotCXJldCA9IHNkbWFfbG9hZF9jb250
ZXh0KHNkbWFjKTsNCi0NCi0JcmV0dXJuIHJldDsNCisJcmV0dXJuIDA7DQogfQ0KIA0KIHN0YXRp
YyBpbnQgc2RtYV9zZXRfY2hhbm5lbF9wcmlvcml0eShzdHJ1Y3Qgc2RtYV9jaGFubmVsICpzZG1h
YywNCg==
