Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,4/4] dmaengine: imx-sdma: use GFP_NOWAIT for dma descriptor allocations
From: Robin Gong <yibin.gong@nxp.com>
Message-Id: <1541504525-25720-5-git-send-email-yibin.gong@nxp.com>
Date: Tue, 6 Nov 2018 03:40:37 +0000
To: "vkoul@kernel.org" <vkoul@kernel.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <dmaengine.vger.kernel.org>

RnJvbTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+CgpETUEgYnVmZmVyIGRl
c2NyaXB0b3JzIGFyZW4ndCBhbGxvY2F0ZWQgZnJvbSBhdG9taWMgY29udGV4dCwgc28gdGhleQpj
YW4gdXNlIHRoZSBsZXNzIGhlYXZ5d2VpZ3RoIEdGUF9OT1dBSVQuCgpTaWduZWQtb2ZmLWJ5OiBM
dWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KU2lnbmVkLW9mZi1ieTogUm9iaW4g
R29uZyA8eWliaW4uZ29uZ0BueHAuY29tPgotLS0KIGRyaXZlcnMvZG1hL2lteC1zZG1hLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2RtYS9pbXgtc2RtYS5jIGIvZHJpdmVycy9kbWEvaW14LXNkbWEuYwpp
bmRleCAwM2Q0NmYxLi5jYjFiNDRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS9pbXgtc2RtYS5j
CisrKyBiL2RyaXZlcnMvZG1hL2lteC1zZG1hLmMKQEAgLTEyMTQsNyArMTIxNCw3IEBAIHN0YXRp
YyBpbnQgc2RtYV9hbGxvY19iZChzdHJ1Y3Qgc2RtYV9kZXNjICpkZXNjKQogCWludCByZXQgPSAw
OwogCiAJZGVzYy0+YmQgPSBkbWFfemFsbG9jX2NvaGVyZW50KE5VTEwsIGJkX3NpemUsICZkZXNj
LT5iZF9waHlzLAotCQkJCQlHRlBfQVRPTUlDKTsKKwkJCQkJR0ZQX05PV0FJVCk7CiAJaWYgKCFk
ZXNjLT5iZCkgewogCQlyZXQgPSAtRU5PTUVNOwogCQlnb3RvIG91dDsK
