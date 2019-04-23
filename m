Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,02/15] Revert "ARM: dts: imx6: Use correct SDMA script for SPI cores"
From: Robin Gong <yibin.gong@nxp.com>
Message-Id: <1556027045-5269-3-git-send-email-yibin.gong@nxp.com>
Date: Tue, 23 Apr 2019 13:50:46 +0000
To: "broonie@kernel.org" <broonie@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "plyatov@gmail.com" <plyatov@gmail.com>, "sean.nyekjaer@prevas.dk" <sean.nyekjaer@prevas.dk>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <dmaengine.vger.kernel.org>

VGhpcyByZXZlcnRzIGNvbW1pdCBkZDRiNDg3YjMyYTM1NzFmZGNjNjYwNjJlNjYxZTNhM2UzNjBl
MzViLg0KDQpTaWduZWQtb2ZmLWJ5OiBSb2JpbiBHb25nIDx5aWJpbi5nb25nQG54cC5jb20+DQot
LS0NCiBhcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLmR0c2kgfCA4ICsrKystLS0tDQogMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCg0KLS0gDQoyLjcuNAoK
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwuZHRzaSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL2lteDZxZGwuZHRzaQ0KaW5kZXggYjNhNzdiYy4uYTkwZjIxNyAxMDA2NDQNCi0tLSBh
L2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwuZHRzaQ0KKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMv
aW14NnFkbC5kdHNpDQpAQCAtMzM5LDcgKzMzOSw3IEBADQogCQkJCQljbG9ja3MgPSA8JmNsa3Mg
SU1YNlFETF9DTEtfRUNTUEkxPiwNCiAJCQkJCQkgPCZjbGtzIElNWDZRRExfQ0xLX0VDU1BJMT47
DQogCQkJCQljbG9jay1uYW1lcyA9ICJpcGciLCAicGVyIjsNCi0JCQkJCWRtYXMgPSA8JnNkbWEg
MyA4IDE+LCA8JnNkbWEgNCA4IDI+Ow0KKwkJCQkJZG1hcyA9IDwmc2RtYSAzIDcgMT4sIDwmc2Rt
YSA0IDcgMj47DQogCQkJCQlkbWEtbmFtZXMgPSAicngiLCAidHgiOw0KIAkJCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsNCiAJCQkJfTsNCkBAIC0zNTMsNyArMzUzLDcgQEANCiAJCQkJCWNsb2NrcyA9
IDwmY2xrcyBJTVg2UURMX0NMS19FQ1NQSTI+LA0KIAkJCQkJCSA8JmNsa3MgSU1YNlFETF9DTEtf
RUNTUEkyPjsNCiAJCQkJCWNsb2NrLW5hbWVzID0gImlwZyIsICJwZXIiOw0KLQkJCQkJZG1hcyA9
IDwmc2RtYSA1IDggMT4sIDwmc2RtYSA2IDggMj47DQorCQkJCQlkbWFzID0gPCZzZG1hIDUgNyAx
PiwgPCZzZG1hIDYgNyAyPjsNCiAJCQkJCWRtYS1uYW1lcyA9ICJyeCIsICJ0eCI7DQogCQkJCQlz
dGF0dXMgPSAiZGlzYWJsZWQiOw0KIAkJCQl9Ow0KQEAgLTM2Nyw3ICszNjcsNyBAQA0KIAkJCQkJ
Y2xvY2tzID0gPCZjbGtzIElNWDZRRExfQ0xLX0VDU1BJMz4sDQogCQkJCQkJIDwmY2xrcyBJTVg2
UURMX0NMS19FQ1NQSTM+Ow0KIAkJCQkJY2xvY2stbmFtZXMgPSAiaXBnIiwgInBlciI7DQotCQkJ
CQlkbWFzID0gPCZzZG1hIDcgOCAxPiwgPCZzZG1hIDggOCAyPjsNCisJCQkJCWRtYXMgPSA8JnNk
bWEgNyA3IDE+LCA8JnNkbWEgOCA3IDI+Ow0KIAkJCQkJZG1hLW5hbWVzID0gInJ4IiwgInR4IjsN
CiAJCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQogCQkJCX07DQpAQCAtMzgxLDcgKzM4MSw3IEBA
DQogCQkJCQljbG9ja3MgPSA8JmNsa3MgSU1YNlFETF9DTEtfRUNTUEk0PiwNCiAJCQkJCQkgPCZj
bGtzIElNWDZRRExfQ0xLX0VDU1BJND47DQogCQkJCQljbG9jay1uYW1lcyA9ICJpcGciLCAicGVy
IjsNCi0JCQkJCWRtYXMgPSA8JnNkbWEgOSA4IDE+LCA8JnNkbWEgMTAgOCAyPjsNCisJCQkJCWRt
YXMgPSA8JnNkbWEgOSA3IDE+LCA8JnNkbWEgMTAgNyAyPjsNCiAJCQkJCWRtYS1uYW1lcyA9ICJy
eCIsICJ0eCI7DQogCQkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KIAkJCQl9Ow0K
