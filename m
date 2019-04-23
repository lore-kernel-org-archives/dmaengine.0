Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,05/15] dma: engine: imx-sdma: add mcu_2_ecspi script
From: Robin Gong <yibin.gong@nxp.com>
Message-Id: <1556027045-5269-6-git-send-email-yibin.gong@nxp.com>
Date: Tue, 23 Apr 2019 13:51:00 +0000
To: "broonie@kernel.org" <broonie@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "plyatov@gmail.com" <plyatov@gmail.com>, "sean.nyekjaer@prevas.dk" <sean.nyekjaer@prevas.dk>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <dmaengine.vger.kernel.org>

QWRkIG1jdV8yX2Vjc3BpIHNjcmlwdCB0byBmaXggZWNzcGkgZXJyYXRhIEVSUjAwOTE2NS4NCg0K
U2lnbmVkLW9mZi1ieTogUm9iaW4gR29uZyA8eWliaW4uZ29uZ0BueHAuY29tPg0KLS0tDQogZHJp
dmVycy9kbWEvaW14LXNkbWEuYyAgICAgICAgICAgICAgICAgICAgIHwgMyArKysNCiBpbmNsdWRl
L2xpbnV4L3BsYXRmb3JtX2RhdGEvZG1hLWlteC1zZG1hLmggfCAxICsNCiAyIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQ0KDQotLSANCjIuNy40CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9k
bWEvaW14LXNkbWEuYyBiL2RyaXZlcnMvZG1hL2lteC1zZG1hLmMNCmluZGV4IDhhOGNlOThhLi4x
ZTIwNDcwIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9kbWEvaW14LXNkbWEuYw0KKysrIGIvZHJpdmVy
cy9kbWEvaW14LXNkbWEuYw0KQEAgLTkyNCw2ICs5MjQsOSBAQCBzdGF0aWMgdm9pZCBzZG1hX2dl
dF9wYyhzdHJ1Y3Qgc2RtYV9jaGFubmVsICpzZG1hYywNCiAJCWVtaV8yX3BlciA9IHNkbWEtPnNj
cmlwdF9hZGRycy0+bWN1XzJfYXRhX2FkZHI7DQogCQlicmVhazsNCiAJY2FzZSBJTVhfRE1BVFlQ
RV9DU1BJOg0KKwkJcGVyXzJfZW1pID0gc2RtYS0+c2NyaXB0X2FkZHJzLT5hcHBfMl9tY3VfYWRk
cjsNCisJCWVtaV8yX3BlciA9IHNkbWEtPnNjcmlwdF9hZGRycy0+bWN1XzJfZWNzcGlfYWRkcjsN
CisJCWJyZWFrOw0KIAljYXNlIElNWF9ETUFUWVBFX0VYVDoNCiAJY2FzZSBJTVhfRE1BVFlQRV9T
U0k6DQogCWNhc2UgSU1YX0RNQVRZUEVfU0FJOg0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
cGxhdGZvcm1fZGF0YS9kbWEtaW14LXNkbWEuaCBiL2luY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0
YS9kbWEtaW14LXNkbWEuaA0KaW5kZXggNmVhYTUzYy4uZjc5NGZlZSAxMDA2NDQNCi0tLSBhL2lu
Y2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9kbWEtaW14LXNkbWEuaA0KKysrIGIvaW5jbHVkZS9s
aW51eC9wbGF0Zm9ybV9kYXRhL2RtYS1pbXgtc2RtYS5oDQpAQCAtNTEsNiArNTEsNyBAQCBzdHJ1
Y3Qgc2RtYV9zY3JpcHRfc3RhcnRfYWRkcnMgew0KIAkvKiBFbmQgb2YgdjIgYXJyYXkgKi8NCiAJ
czMyIHpjYW5mZF8yX21jdV9hZGRyOw0KIAlzMzIgenFzcGlfMl9tY3VfYWRkcjsNCisJczMyIG1j
dV8yX2Vjc3BpX2FkZHI7DQogCS8qIEVuZCBvZiB2MyBhcnJheSAqLw0KIH07DQogDQo=
