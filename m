Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,13/15] ARM: dts: imx6ul: add dma support on ecspi
From: Robin Gong <yibin.gong@nxp.com>
Message-Id: <1556027045-5269-14-git-send-email-yibin.gong@nxp.com>
Date: Tue, 23 Apr 2019 13:51:40 +0000
To: "broonie@kernel.org" <broonie@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "plyatov@gmail.com" <plyatov@gmail.com>, "sean.nyekjaer@prevas.dk" <sean.nyekjaer@prevas.dk>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <dmaengine.vger.kernel.org>

QWRkIGRtYSBzdXBwb3J0IG9uIGVjc3BpLg0KDQpTaWduZWQtb2ZmLWJ5OiBSb2JpbiBHb25nIDx5
aWJpbi5nb25nQG54cC5jb20+DQotLS0NCiBhcmNoL2FybS9ib290L2R0cy9pbXg2dWwuZHRzaSB8
IDggKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQoNCi0tIA0KMi43
LjQKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXg2dWwuZHRzaSBiL2FyY2gvYXJt
L2Jvb3QvZHRzL2lteDZ1bC5kdHNpDQppbmRleCBiYmYwMTBjLi44ODBiOWVlIDEwMDY0NA0KLS0t
IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnVsLmR0c2kNCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L2lteDZ1bC5kdHNpDQpAQCAtMjI2LDYgKzIyNiw4IEBADQogCQkJCQljbG9ja3MgPSA8JmNsa3Mg
SU1YNlVMX0NMS19FQ1NQSTE+LA0KIAkJCQkJCSA8JmNsa3MgSU1YNlVMX0NMS19FQ1NQSTE+Ow0K
IAkJCQkJY2xvY2stbmFtZXMgPSAiaXBnIiwgInBlciI7DQorCQkJCQlkbWFzID0gPCZzZG1hIDMg
NyAxPiwgPCZzZG1hIDQgNyAyPjsNCisJCQkJCWRtYS1uYW1lcyA9ICJyeCIsICJ0eCI7DQogCQkJ
CQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KIAkJCQl9Ow0KIA0KQEAgLTIzOCw2ICsyNDAsOCBAQA0K
IAkJCQkJY2xvY2tzID0gPCZjbGtzIElNWDZVTF9DTEtfRUNTUEkyPiwNCiAJCQkJCQkgPCZjbGtz
IElNWDZVTF9DTEtfRUNTUEkyPjsNCiAJCQkJCWNsb2NrLW5hbWVzID0gImlwZyIsICJwZXIiOw0K
KwkJCQkJZG1hcyA9IDwmc2RtYSA1IDcgMT4sIDwmc2RtYSA2IDcgMj47DQorCQkJCQlkbWEtbmFt
ZXMgPSAicngiLCAidHgiOw0KIAkJCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCiAJCQkJfTsNCiAN
CkBAIC0yNTAsNiArMjU0LDggQEANCiAJCQkJCWNsb2NrcyA9IDwmY2xrcyBJTVg2VUxfQ0xLX0VD
U1BJMz4sDQogCQkJCQkJIDwmY2xrcyBJTVg2VUxfQ0xLX0VDU1BJMz47DQogCQkJCQljbG9jay1u
YW1lcyA9ICJpcGciLCAicGVyIjsNCisJCQkJCWRtYXMgPSA8JnNkbWEgNyA3IDE+LCA8JnNkbWEg
OCA3IDI+Ow0KKwkJCQkJZG1hLW5hbWVzID0gInJ4IiwgInR4IjsNCiAJCQkJCXN0YXR1cyA9ICJk
aXNhYmxlZCI7DQogCQkJCX07DQogDQpAQCAtMjYyLDYgKzI2OCw4IEBADQogCQkJCQljbG9ja3Mg
PSA8JmNsa3MgSU1YNlVMX0NMS19FQ1NQSTQ+LA0KIAkJCQkJCSA8JmNsa3MgSU1YNlVMX0NMS19F
Q1NQSTQ+Ow0KIAkJCQkJY2xvY2stbmFtZXMgPSAiaXBnIiwgInBlciI7DQorCQkJCQlkbWFzID0g
PCZzZG1hIDkgNyAxPiwgPCZzZG1hIDEwIDcgMj47DQorCQkJCQlkbWEtbmFtZXMgPSAicngiLCAi
dHgiOw0KIAkJCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCiAJCQkJfTsNCiANCg==
