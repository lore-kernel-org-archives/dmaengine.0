Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,1/4] Revert "dmaengine: imx-sdma: Use GFP_NOWAIT for dma allocations"
From: Robin Gong <yibin.gong@nxp.com>
Message-Id: <1541504525-25720-2-git-send-email-yibin.gong@nxp.com>
Date: Tue, 6 Nov 2018 03:40:25 +0000
To: "vkoul@kernel.org" <vkoul@kernel.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <dmaengine.vger.kernel.org>

RnJvbTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+CgpUaGlzIHJldmVydHMg
Y29tbWl0IGMxMTk5ODc1ZDMyNywgYXMgdGhpcyBkZXBlbmRzIG9uIGFub3RoZXIgY29tbWl0CnRo
YXQgaXMgZ29pbmcgdG8gYmUgcmV2ZXJ0ZWQuCgpTaWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8
bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KU2lnbmVkLW9mZi1ieTogUm9iaW4gR29uZyA8eWliaW4u
Z29uZ0BueHAuY29tPgotLS0KIGRyaXZlcnMvZG1hL2lteC1zZG1hLmMgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9kbWEvaW14LXNkbWEuYyBiL2RyaXZlcnMvZG1hL2lteC1zZG1hLmMKaW5kZXggYjRl
YzJkMi4uM2JjYTVlMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9kbWEvaW14LXNkbWEuYworKysgYi9k
cml2ZXJzL2RtYS9pbXgtc2RtYS5jCkBAIC0xMTk0LDggKzExOTQsOCBAQCBzdGF0aWMgaW50IHNk
bWFfYWxsb2NfYmQoc3RydWN0IHNkbWFfZGVzYyAqZGVzYykKIHsKIAlpbnQgcmV0ID0gMDsKIAot
CWRlc2MtPmJkID0gZG1hX3Bvb2xfYWxsb2MoZGVzYy0+c2RtYWMtPmJkX3Bvb2wsIEdGUF9OT1dB
SVQsCi0JCQkJICAmZGVzYy0+YmRfcGh5cyk7CisJZGVzYy0+YmQgPSBkbWFfcG9vbF9hbGxvYyhk
ZXNjLT5zZG1hYy0+YmRfcG9vbCwgR0ZQX0FUT01JQywKKwkJCQkJJmRlc2MtPmJkX3BoeXMpOwog
CWlmICghZGVzYy0+YmQpIHsKIAkJcmV0ID0gLUVOT01FTTsKIAkJZ290byBvdXQ7Cg==
