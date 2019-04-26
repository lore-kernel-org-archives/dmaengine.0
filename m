Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,05/15] dmaengine: imx-sdma: add mcu_2_ecspi script
From: Robin Gong <yibin.gong@nxp.com>
Message-Id: <1556265512-9130-6-git-send-email-yibin.gong@nxp.com>
Date: Fri, 26 Apr 2019 08:05:34 +0000
To: "broonie@kernel.org" <broonie@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "plyatov@gmail.com" <plyatov@gmail.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <dmaengine.vger.kernel.org>

QWRkIG1jdV8yX2Vjc3BpIHNjcmlwdCB0byBmaXggZWNzcGkgZXJyYXRhIEVSUjAwOTE2NS4NCg0K
U2lnbmVkLW9mZi1ieTogUm9iaW4gR29uZyA8eWliaW4uZ29uZ0BueHAuY29tPg0KLS0tDQogZHJp
dmVycy9kbWEvaW14LXNkbWEuYyAgICAgICAgICAgICAgICAgICAgIHwgMyArKysNCiBpbmNsdWRl
L2xpbnV4L3BsYXRmb3JtX2RhdGEvZG1hLWlteC1zZG1hLmggfCAxICsNCiAyIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQ0KDQotLSANCjIuNy40CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9k
bWEvaW14LXNkbWEuYyBiL2RyaXZlcnMvZG1hL2lteC1zZG1hLmMNCmluZGV4IDg2YTMxYjQuLjM1
MmIwZDUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2RtYS9pbXgtc2RtYS5jDQorKysgYi9kcml2ZXJz
L2RtYS9pbXgtc2RtYS5jDQpAQCAtOTI0LDYgKzkyNCw5IEBAIHN0YXRpYyB2b2lkIHNkbWFfZ2V0
X3BjKHN0cnVjdCBzZG1hX2NoYW5uZWwgKnNkbWFjLA0KIAkJZW1pXzJfcGVyID0gc2RtYS0+c2Ny
aXB0X2FkZHJzLT5tY3VfMl9hdGFfYWRkcjsNCiAJCWJyZWFrOw0KIAljYXNlIElNWF9ETUFUWVBF
X0NTUEk6DQorCQlwZXJfMl9lbWkgPSBzZG1hLT5zY3JpcHRfYWRkcnMtPmFwcF8yX21jdV9hZGRy
Ow0KKwkJZW1pXzJfcGVyID0gc2RtYS0+c2NyaXB0X2FkZHJzLT5tY3VfMl9lY3NwaV9hZGRyOw0K
KwkJYnJlYWs7DQogCWNhc2UgSU1YX0RNQVRZUEVfRVhUOg0KIAljYXNlIElNWF9ETUFUWVBFX1NT
SToNCiAJY2FzZSBJTVhfRE1BVFlQRV9TQUk6DQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9w
bGF0Zm9ybV9kYXRhL2RtYS1pbXgtc2RtYS5oIGIvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRh
L2RtYS1pbXgtc2RtYS5oDQppbmRleCA2ZWFhNTNjLi5mNzk0ZmVlIDEwMDY0NA0KLS0tIGEvaW5j
bHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2RtYS1pbXgtc2RtYS5oDQorKysgYi9pbmNsdWRlL2xp
bnV4L3BsYXRmb3JtX2RhdGEvZG1hLWlteC1zZG1hLmgNCkBAIC01MSw2ICs1MSw3IEBAIHN0cnVj
dCBzZG1hX3NjcmlwdF9zdGFydF9hZGRycyB7DQogCS8qIEVuZCBvZiB2MiBhcnJheSAqLw0KIAlz
MzIgemNhbmZkXzJfbWN1X2FkZHI7DQogCXMzMiB6cXNwaV8yX21jdV9hZGRyOw0KKwlzMzIgbWN1
XzJfZWNzcGlfYWRkcjsNCiAJLyogRW5kIG9mIHYzIGFycmF5ICovDQogfTsNCiANCg==
