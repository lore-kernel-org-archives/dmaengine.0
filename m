Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,03/15] Revert "dmaengine: imx-sdma: refine to load context only once"
From: Robin Gong <yibin.gong@nxp.com>
Message-Id: <1556027045-5269-4-git-send-email-yibin.gong@nxp.com>
Date: Tue, 23 Apr 2019 13:50:50 +0000
To: "broonie@kernel.org" <broonie@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "plyatov@gmail.com" <plyatov@gmail.com>, "sean.nyekjaer@prevas.dk" <sean.nyekjaer@prevas.dk>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <dmaengine.vger.kernel.org>

VGhpcyByZXZlcnRzIGNvbW1pdCBhZDBkOTJkN2JhNmFlY2JlMjcwNTkwN2MzOGZmOGQ4YmU0ZGEx
ZTljLCBiZWNhdXNlDQppbiBzcGktaW14IGNhc2UsIGJ1cnN0IGxlbmd0aCBtYXkgYmUgY2hhbmdl
ZCBkeW5hbWljYWxseS4NCg0KU2lnbmVkLW9mZi1ieTogUm9iaW4gR29uZyA8eWliaW4uZ29uZ0Bu
eHAuY29tPg0KLS0tDQogZHJpdmVycy9kbWEvaW14LXNkbWEuYyB8IDcgLS0tLS0tLQ0KIDEgZmls
ZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQ0KDQotLSANCjIuNy40CgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9kbWEvaW14LXNkbWEuYyBiL2RyaXZlcnMvZG1hL2lteC1zZG1hLmMNCmluZGV4IDk5ZDlm
NDMuLjQwN2E1NmUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2RtYS9pbXgtc2RtYS5jDQorKysgYi9k
cml2ZXJzL2RtYS9pbXgtc2RtYS5jDQpAQCAtMzc3LDcgKzM3Nyw2IEBAIHN0cnVjdCBzZG1hX2No
YW5uZWwgew0KIAl1bnNpZ25lZCBsb25nCQkJd2F0ZXJtYXJrX2xldmVsOw0KIAl1MzIJCQkJc2hw
X2FkZHIsIHBlcl9hZGRyOw0KIAllbnVtIGRtYV9zdGF0dXMJCQlzdGF0dXM7DQotCWJvb2wJCQkJ
Y29udGV4dF9sb2FkZWQ7DQogCXN0cnVjdCBpbXhfZG1hX2RhdGEJCWRhdGE7DQogCXN0cnVjdCB3
b3JrX3N0cnVjdAkJdGVybWluYXRlX3dvcmtlcjsNCiB9Ow0KQEAgLTk4OCw5ICs5ODcsNiBAQCBz
dGF0aWMgaW50IHNkbWFfbG9hZF9jb250ZXh0KHN0cnVjdCBzZG1hX2NoYW5uZWwgKnNkbWFjKQ0K
IAlpbnQgcmV0Ow0KIAl1bnNpZ25lZCBsb25nIGZsYWdzOw0KIA0KLQlpZiAoc2RtYWMtPmNvbnRl
eHRfbG9hZGVkKQ0KLQkJcmV0dXJuIDA7DQotDQogCWlmIChzZG1hYy0+ZGlyZWN0aW9uID09IERN
QV9ERVZfVE9fTUVNKQ0KIAkJbG9hZF9hZGRyZXNzID0gc2RtYWMtPnBjX2Zyb21fZGV2aWNlOw0K
IAllbHNlIGlmIChzZG1hYy0+ZGlyZWN0aW9uID09IERNQV9ERVZfVE9fREVWKQ0KQEAgLTEwMzMs
OCArMTAyOSw2IEBAIHN0YXRpYyBpbnQgc2RtYV9sb2FkX2NvbnRleHQoc3RydWN0IHNkbWFfY2hh
bm5lbCAqc2RtYWMpDQogDQogCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNkbWEtPmNoYW5uZWxf
MF9sb2NrLCBmbGFncyk7DQogDQotCXNkbWFjLT5jb250ZXh0X2xvYWRlZCA9IHRydWU7DQotDQog
CXJldHVybiByZXQ7DQogfQ0KIA0KQEAgLTEwNzQsNyArMTA2OCw2IEBAIHN0YXRpYyB2b2lkIHNk
bWFfY2hhbm5lbF90ZXJtaW5hdGVfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQogCXNk
bWFjLT5kZXNjID0gTlVMTDsNCiAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2RtYWMtPnZjLmxv
Y2ssIGZsYWdzKTsNCiAJdmNoYW5fZG1hX2Rlc2NfZnJlZV9saXN0KCZzZG1hYy0+dmMsICZoZWFk
KTsNCi0Jc2RtYWMtPmNvbnRleHRfbG9hZGVkID0gZmFsc2U7DQogfQ0KIA0KIHN0YXRpYyBpbnQg
c2RtYV9kaXNhYmxlX2NoYW5uZWxfYXN5bmMoc3RydWN0IGRtYV9jaGFuICpjaGFuKQ0K
