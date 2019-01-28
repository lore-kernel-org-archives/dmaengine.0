Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v5,5/5] dmaengine: imx-sdma: fix consistent dma test failures
From: Angus Ainslie <angus@akkea.ca>
Message-Id: <20190128060840.31695-6-angus@akkea.ca>
Date: Sun, 27 Jan 2019 23:08:40 -0700
To: angus@akkea.ca
Cc: angus.ainslie@puri.sm, Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, Daniel Baluta <daniel.baluta@gmail.com>
List-ID: <dmaengine.vger.kernel.org>

V2l0aG91dCB0aGUgY29weSBiZWluZyBhbGlnbmVkIHNkbWExIGZhaWxzIH4xMCUgb2YgdGhlIHRp
bWUKClNpZ25lZC1vZmYtYnk6IEFuZ3VzIEFpbnNsaWUgKFB1cmlzbSkgPGFuZ3VzQGFra2VhLmNh
PgotLS0KIGRyaXZlcnMvZG1hL2lteC1zZG1hLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hL2lteC1zZG1hLmMgYi9kcml2ZXJz
L2RtYS9pbXgtc2RtYS5jCmluZGV4IGQ1Zjg2YmVjZjU5ZS4uODg5MTBlYzA5NTY4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2RtYS9pbXgtc2RtYS5jCisrKyBiL2RyaXZlcnMvZG1hL2lteC1zZG1hLmMK
QEAgLTIxMTgsNiArMjExOCw3IEBAIHN0YXRpYyBpbnQgc2RtYV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogCXNkbWEtPmRtYV9kZXZpY2UuZGV2aWNlX3ByZXBfZG1hX21lbWNw
eSA9IHNkbWFfcHJlcF9tZW1jcHk7CiAJc2RtYS0+ZG1hX2RldmljZS5kZXZpY2VfaXNzdWVfcGVu
ZGluZyA9IHNkbWFfaXNzdWVfcGVuZGluZzsKIAlzZG1hLT5kbWFfZGV2aWNlLmRldi0+ZG1hX3Bh
cm1zID0gJnNkbWEtPmRtYV9wYXJtczsKKwlzZG1hLT5kbWFfZGV2aWNlLmNvcHlfYWxpZ24gPSAy
OwogCWRtYV9zZXRfbWF4X3NlZ19zaXplKHNkbWEtPmRtYV9kZXZpY2UuZGV2LCBTRE1BX0JEX01B
WF9DTlQpOwogCiAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgc2RtYSk7Cg==
