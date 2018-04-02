Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [06/15] net: smc911x: remove the dmaengine compat need
From: Robert Jarzmik <robert.jarzmik@free.fr>
Message-Id: <20180402142656.26815-7-robert.jarzmik@free.fr>
Date: Mon,  2 Apr 2018 16:26:47 +0200
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Nicolas Pitre <nico@fluxnic.net>, Samuel Ortiz <samuel@sortiz.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, "yuval.shaia@oracle.com" <yuval.shaia@oracle.com>, Robert Jarzmik <robert.jarzmik@renault.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org
List-ID: <dmaengine.vger.kernel.org>

RnJvbTogUm9iZXJ0IEphcnptaWsgPHJvYmVydC5qYXJ6bWlrQHJlbmF1bHQuY29tPgoKQXMgdGhl
IHB4YSBhcmNoaXRlY3R1cmUgc3dpdGNoZWQgdG93YXJkcyB0aGUgZG1hZW5naW5lIHNsYXZlIG1h
cCwgdGhlCm9sZCBjb21wYXRpYmlsaXR5IG1lY2hhbmlzbSB0byBhY3F1aXJlIHRoZSBkbWEgcmVx
dWVzdG9yIGxpbmUgbnVtYmVyIGFuZApwcmlvcml0eSBhcmUgbm90IG5lZWRlZCBhbnltb3JlLgoK
VGhpcyBwYXRjaCBzaW1wbGlmaWVzIHRoZSBkbWEgcmVzb3VyY2UgYWNxdWlzaXRpb24sIHVzaW5n
IHRoZSBtb3JlCmdlbmVyaWMgZnVuY3Rpb24gZG1hX3JlcXVlc3Rfc2xhdmVfY2hhbm5lbCgpLgoK
U2lnbmVkLW9mZi1ieTogUm9iZXJ0IEphcnptaWsgPHJvYmVydC5qYXJ6bWlrQGZyZWUuZnI+Ci0t
LQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc21zYy9zbWM5MTF4LmMgfCAxNiArKy0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zbXNjL3NtYzkxMXguYyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3Ntc2Mvc21jOTExeC5jCmluZGV4IDA1MTU3NDQyYTk4MC4uNGMzNzEzYmQ1
Y2FhIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zbXNjL3NtYzkxMXguYworKysg
Yi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zbXNjL3NtYzkxMXguYwpAQCAtNzQsNyArNzQsNiBAQCBz
dGF0aWMgY29uc3QgY2hhciB2ZXJzaW9uW10gPQogI2luY2x1ZGUgPGxpbnV4L3NrYnVmZi5oPgog
CiAjaW5jbHVkZSA8bGludXgvZG1hZW5naW5lLmg+Ci0jaW5jbHVkZSA8bGludXgvZG1hL3B4YS1k
bWEuaD4KIAogI2luY2x1ZGUgPGFzbS9pby5oPgogCkBAIC0xNzk0LDggKzE3OTMsNiBAQCBzdGF0
aWMgaW50IHNtYzkxMXhfcHJvYmUoc3RydWN0IG5ldF9kZXZpY2UgKmRldikKIAl1bnNpZ25lZCBs
b25nIGlycV9mbGFnczsKICNpZmRlZiBTTUNfVVNFX0RNQQogCXN0cnVjdCBkbWFfc2xhdmVfY29u
ZmlnCWNvbmZpZzsKLQlkbWFfY2FwX21hc2tfdCBtYXNrOwotCXN0cnVjdCBweGFkX3BhcmFtIHBh
cmFtOwogI2VuZGlmCiAKIAlEQkcoU01DX0RFQlVHX0ZVTkMsIGRldiwgIi0tPiAlc1xuIiwgX19m
dW5jX18pOwpAQCAtMTk2OSwxNyArMTk2Niw4IEBAIHN0YXRpYyBpbnQgc21jOTExeF9wcm9iZShz
dHJ1Y3QgbmV0X2RldmljZSAqZGV2KQogCiAjaWZkZWYgU01DX1VTRV9ETUEKIAotCWRtYV9jYXBf
emVybyhtYXNrKTsKLQlkbWFfY2FwX3NldChETUFfU0xBVkUsIG1hc2spOwotCXBhcmFtLnByaW8g
PSBQWEFEX1BSSU9fTE9XRVNUOwotCXBhcmFtLmRyY21yID0gLTFVTDsKLQotCWxwLT5yeGRtYSA9
Ci0JCWRtYV9yZXF1ZXN0X3NsYXZlX2NoYW5uZWxfY29tcGF0KG1hc2ssIHB4YWRfZmlsdGVyX2Zu
LAotCQkJCQkJICZwYXJhbSwgJmRldi0+ZGV2LCAicngiKTsKLQlscC0+dHhkbWEgPQotCQlkbWFf
cmVxdWVzdF9zbGF2ZV9jaGFubmVsX2NvbXBhdChtYXNrLCBweGFkX2ZpbHRlcl9mbiwKLQkJCQkJ
CSAmcGFyYW0sICZkZXYtPmRldiwgInR4Iik7CisJbHAtPnJ4ZG1hID0gZG1hX3JlcXVlc3Rfc2xh
dmVfY2hhbm5lbCgmZGV2LT5kZXYsICJyeCIpOworCWxwLT50eGRtYSA9IGRtYV9yZXF1ZXN0X3Ns
YXZlX2NoYW5uZWwoJmRldi0+ZGV2LCAidHgiKTsKIAlscC0+cnhkbWFfYWN0aXZlID0gMDsKIAls
cC0+dHhkbWFfYWN0aXZlID0gMDsKIAo=
